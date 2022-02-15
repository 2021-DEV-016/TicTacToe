//
//  BoardViewModel.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//


import Foundation

protocol BoardViewModelDelegate: AnyObject {
    func mustShowAlert(_ viewModel: BoardViewModel, alert: Alert)
}

final class BoardViewModel {
    
    // MARK: - Delegate
    
    weak var delegate: BoardViewModelDelegate?
    
    // MARK: - Public Variables
    
    var createBoard: ((_ size: Int) -> Void)?
    var disableBoard: ((Bool) -> Void)?
    var turnLabelText: ((_ turn: String) -> Void)?
    
    let resetButtonTitle: String = "Reset"
    
    // MARK: - Internals
    
    private let boardEngine: BoardEngine
    private let configuration: BoardConfiguration
    private var currentPlayer: Player {
        didSet {
            setTurnLabelText()
        }
    }
    
    // MARK: - Init
    
    init(boardEngine: BoardEngine, configuration: BoardConfiguration) {
        self.boardEngine = boardEngine
        self.configuration = configuration
        self.currentPlayer = configuration.firstPlayer
    }
    
    // MARK: - Private
    
    private func createNewBoard() {
        self.currentPlayer = configuration.firstPlayer
        
        boardEngine.reset()
        createBoard?(configuration.size)
        disableBoard?(false)
    }
    
    private func setTurnLabelText() {
        turnLabelText?("Turn player: \(currentPlayer.boardSquareTitle)")
    }
    
    // MARK: - Public
    
    func didTapBoardSquare(view: BoardSquareView, columnNumber: Int, rowNumber: Int) {
        view.setTitle(currentPlayer.boardSquareTitle)
        
        let gameState = boardEngine.doMove(columnNumber: columnNumber, rowNumber: rowNumber, player: currentPlayer)
        
        var alert: Alert?
        
        switch gameState {
        case .draw:
            alert = Alert(title: "DRAW", description: "Nobody won", button: "Ok")
        case .won(let player):
            alert = Alert(title: "WON", description: "Player: \(player.boardSquareTitle) won", button: "Ok")
        case .onGoing:
            currentPlayer = currentPlayer.nextPlayer
        }
        
        guard let alert = alert else { return }
        
        // disable the board after win/draw condition
        disableBoard?(true)
        
        delegate?.mustShowAlert(self, alert: alert)
    }
    
    func didTapResetButton() {
        createNewBoard()
    }
    
    func viewDidLoad() {
        createNewBoard()
    }
}
