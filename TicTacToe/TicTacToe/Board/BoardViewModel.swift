//
//  BoardViewModel.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//


import Foundation

final class BoardViewModel {
    
    // MARK: - Public Variables
    
    var createBoard: ((_ size: Int) -> Void)?
    var disableBoard: ((Bool) -> Void)?
    var turnLabelText: ((_ turn: String) -> Void)?
    
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
        
        createBoard?(configuration.size)
    }
    
    private func setTurnLabelText() {
        turnLabelText?("Turn player: \(currentPlayer.boardSquareTitle)")
    }
    
    // MARK: - Public
    
    func didTapBoardSquare(view: BoardSquareView, columnNumber: Int, rowNumber: Int) {
        view.setTitle(currentPlayer.boardSquareTitle)
        
        let gameState = boardEngine.doMove(columnNumber: columnNumber, rowNumber: rowNumber, player: currentPlayer)
        
        switch gameState {
        case .draw, .won(_):
            // disable the board after win/draw condition
            disableBoard?(true)
        case .onGoing:
            currentPlayer = currentPlayer.nextPlayer
        }
    }
    
    func viewDidLoad() {
        createNewBoard()
    }
}
