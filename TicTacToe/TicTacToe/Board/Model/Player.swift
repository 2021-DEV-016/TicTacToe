//
//  Player.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation

enum Player {
    
    case x
    case y
    
    var boardSquareTitle: String {
        switch self {
        case .x:
            return "X"
        case .y:
            return "0"
        }
    }
    
    var nextPlayer: Player {
        switch self {
        case .x:
            return .y
        case .y:
            return .x
        }
    }
}
