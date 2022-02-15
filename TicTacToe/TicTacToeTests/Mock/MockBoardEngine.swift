//
//  MockBoardEngine.swift
//  TicTacToeTests
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
@testable import TicTacToe

final class MockBoardEngine: BoardEngine {
    var moves: [Move]
    
    init(moves: [Move] = []) {
        self.moves = moves
    }
    
    func doMove(columnNumber: Int, rowNumber: Int, player: Player) -> GameState {
        moves.append(Move(columnNumber: columnNumber, rowNumber: rowNumber, player: player))
        
        if columnNumber == 80 && rowNumber == 80 {
            return .draw
        }

        return .onGoing
    }
}
