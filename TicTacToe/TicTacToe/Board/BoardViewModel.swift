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
    var turnLabelText: ((_ turn: String) -> Void)?
    
    // MARK: - Internals
    
    private let configuration: BoardConfiguration
    private var currentPlayer: Player {
        didSet {
            setTurnLabelText()
        }
    }
    
    // MARK: - Init
    
    init(configuration: BoardConfiguration) {
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
        
        currentPlayer = currentPlayer.nextPlayer
    }
    
    func viewDidLoad() {
        createNewBoard()
    }
}
