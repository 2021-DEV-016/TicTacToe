//
//  GameState.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation

enum GameState: Equatable {
    case draw
    case won(Player)
    case onGoing
}
