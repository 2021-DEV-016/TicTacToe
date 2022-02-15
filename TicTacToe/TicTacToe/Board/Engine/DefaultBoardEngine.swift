//
//  DefaultBoardEngine.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation

final class DefaultBoardEngine: BoardEngine {
    
    // MARK: - Internals
    
    private let size: Int
    private var moves = [Move]()
    
    // MARK: - Init
    
    init(size: Int) {
        self.size = size
    }
    
    // MARK: - Private
    
    private func checkMoves(_ moves: [Move], player: Player) -> GameState {
        // fetch all moves from the current player
        let currentPlayerMoves = moves.filter { move in
            move.player == player
        }
        
        // horizontal
        for row in [Int](0...size - 1) {
            let currentPlayerMovesForRow = currentPlayerMoves.filter({ move in
                move.rowNumber == row
            })
            
            if currentPlayerMovesForRow.count == size {
                return .won(player)
            }
        }
        
        // vertical
        for column in [Int](0...size - 1) {
            let currentPlayerMovesForColumn = currentPlayerMoves.filter({ move in
                move.columnNumber == column
            })
            
            if currentPlayerMovesForColumn.count == size {
                return .won(player)
            }
        }
        
        // top-left to bottom-right diagonal
        let currentPlayerTopToBottomDiagonalMoves = currentPlayerMoves.filter { move in
            move.columnNumber == move.rowNumber
        }
        
        // bottom-left to top-right diagonal
        let currentPlayerBottomToTopDiagonalMoves = currentPlayerMoves.filter { move in
            return move.columnNumber == (size - 1) - move.rowNumber
        }
        
        if currentPlayerTopToBottomDiagonalMoves.count == size || currentPlayerBottomToTopDiagonalMoves.count == size {
            return .won(player)
        }
                
        // game is a draw
        if moves.count == size * size {
            return .draw
        }
        
        return .onGoing
    }
    
    // MARK: - Public
    
    func doMove(columnNumber: Int, rowNumber: Int, player: Player) -> GameState {
        let move = Move(columnNumber: columnNumber, rowNumber: rowNumber, player: player)
        moves.append(move)
        
        return checkMoves(moves, player: player)
    }
    
    func reset() {
        moves.removeAll()
    }
}
