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
    
    // MARK: - Internals
    
    private let configuration: BoardConfiguration
    
    // MARK: - Init
    
    init(configuration: BoardConfiguration) {
        self.configuration = configuration
    }
    
    // MARK: - Private
    
    private func createNewBoard() {
        createBoard?(configuration.size)
    }
    
    // MARK: - Public
    
    func didTapBoardSquare(view: BoardSquareView, columnNumber: Int, rowNumber: Int) {
        view.setTitle("X")
    }
    
    func viewDidLoad() {
        createNewBoard()
    }
}
