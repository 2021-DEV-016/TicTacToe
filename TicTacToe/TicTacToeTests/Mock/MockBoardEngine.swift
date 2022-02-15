//
//  MockBoardEngine.swift
//  TicTacToeTests
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
@testable import TicTacToe

final class MockBoardEngine: BoardEngine {
    
    func doMove(columnNumber: Int, rowNumber: Int, player: Player) -> GameState {
        return .onGoing
    }
}
