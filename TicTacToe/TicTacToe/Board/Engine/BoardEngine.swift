//
//  BoardEngine.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation

protocol BoardEngine: AnyObject {
    
    func doMove(columnNumber: Int, rowNumber: Int, player: Player) -> GameState
    func reset()
    
}
