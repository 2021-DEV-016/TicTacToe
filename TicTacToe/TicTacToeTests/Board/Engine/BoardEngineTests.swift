//
//  BoardEngineTests.swift
//  TicTacToeTests
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit
import XCTest
@testable import TicTacToe

class BoardEngineTests: XCTestCase {
    
    func testHorizontalFirstPlayerWin() {
        let boardEngine = DefaultBoardEngine(size: 3)
        
        let firstMove = boardEngine.doMove(columnNumber: 0, rowNumber: 0, player: .x)
        let secondMove = boardEngine.doMove(columnNumber: 0, rowNumber: 1, player: .y)
        let thirdMove = boardEngine.doMove(columnNumber: 1, rowNumber: 0, player: .x)
        let fourthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .y)
        let fifthMove = boardEngine.doMove(columnNumber: 2, rowNumber: 0, player: .x)
        
        XCTAssertEqual(firstMove, .onGoing)
        XCTAssertEqual(secondMove, .onGoing)
        XCTAssertEqual(thirdMove, .onGoing)
        XCTAssertEqual(fourthMove, .onGoing)
        XCTAssertEqual(fifthMove, .won(.x))
    }
    
    func testHorizontalSecondPlayerWin() {
        let boardEngine = DefaultBoardEngine(size: 3)
        
        let firstMove = boardEngine.doMove(columnNumber: 0, rowNumber: 0, player: .x)
        let secondMove = boardEngine.doMove(columnNumber: 0, rowNumber: 1, player: .y)
        let thirdMove = boardEngine.doMove(columnNumber: 1, rowNumber: 0, player: .x)
        let fourthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .y)
        let fifthMove = boardEngine.doMove(columnNumber: 0, rowNumber: 2, player: .x)
        let sixthMove = boardEngine.doMove(columnNumber: 2, rowNumber: 1, player: .y)
        
        XCTAssertEqual(firstMove, .onGoing)
        XCTAssertEqual(secondMove, .onGoing)
        XCTAssertEqual(thirdMove, .onGoing)
        XCTAssertEqual(fourthMove, .onGoing)
        XCTAssertEqual(fifthMove, .onGoing)
        XCTAssertEqual(sixthMove, .won(.y))
    }
    
    func testVerticalFirstPlayerWin() {
        let boardEngine = DefaultBoardEngine(size: 3)
        
        let firstMove = boardEngine.doMove(columnNumber: 0, rowNumber: 0, player: .x)
        let secondMove = boardEngine.doMove(columnNumber: 0, rowNumber: 1, player: .y)
        let thirdMove = boardEngine.doMove(columnNumber: 0, rowNumber: 1, player: .x)
        let fourthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .y)
        let fifthMove = boardEngine.doMove(columnNumber: 0, rowNumber: 2, player: .x)
        
        XCTAssertEqual(firstMove, .onGoing)
        XCTAssertEqual(secondMove, .onGoing)
        XCTAssertEqual(thirdMove, .onGoing)
        XCTAssertEqual(fourthMove, .onGoing)
        XCTAssertEqual(fifthMove, .won(.x))
    }
    
    func testVerticalSecondPlayerWin() {
        let boardEngine = DefaultBoardEngine(size: 3)
        
        let firstMove = boardEngine.doMove(columnNumber: 0, rowNumber: 0, player: .x)
        let secondMove = boardEngine.doMove(columnNumber: 1, rowNumber: 0, player: .y)
        let thirdMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .x)
        let fourthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .y)
        let fifthMove = boardEngine.doMove(columnNumber: 2, rowNumber: 0, player: .x)
        let sixthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 2, player: .y)
        
        XCTAssertEqual(firstMove, .onGoing)
        XCTAssertEqual(secondMove, .onGoing)
        XCTAssertEqual(thirdMove, .onGoing)
        XCTAssertEqual(fourthMove, .onGoing)
        XCTAssertEqual(fifthMove, .onGoing)
        XCTAssertEqual(sixthMove, .won(.y))
    }
    
    func testTopToBottomDiagonalFirstPlayerWin() {
        let boardEngine = DefaultBoardEngine(size: 3)
        
        let firstMove = boardEngine.doMove(columnNumber: 0, rowNumber: 0, player: .x)
        let secondMove = boardEngine.doMove(columnNumber: 0, rowNumber: 1, player: .y)
        let thirdMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .x)
        let fourthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .y)
        let fifthMove = boardEngine.doMove(columnNumber: 2, rowNumber: 2, player: .x)
        
        XCTAssertEqual(firstMove, .onGoing)
        XCTAssertEqual(secondMove, .onGoing)
        XCTAssertEqual(thirdMove, .onGoing)
        XCTAssertEqual(fourthMove, .onGoing)
        XCTAssertEqual(fifthMove, .won(.x))
    }
    
    func testTopToBottomDiagonalSecondPlayerWin() {
        let boardEngine = DefaultBoardEngine(size: 3)
        
        let firstMove = boardEngine.doMove(columnNumber: 0, rowNumber: 1, player: .x)
        let secondMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .y)
        let thirdMove = boardEngine.doMove(columnNumber: 0, rowNumber: 1, player: .x)
        let fourthMove = boardEngine.doMove(columnNumber: 0, rowNumber: 0, player: .y)
        let fifthMove = boardEngine.doMove(columnNumber: 2, rowNumber: 0, player: .x)
        let sixthMove = boardEngine.doMove(columnNumber: 2, rowNumber: 2, player: .y)
        
        XCTAssertEqual(firstMove, .onGoing)
        XCTAssertEqual(secondMove, .onGoing)
        XCTAssertEqual(thirdMove, .onGoing)
        XCTAssertEqual(fourthMove, .onGoing)
        XCTAssertEqual(fifthMove, .onGoing)
        XCTAssertEqual(sixthMove, .won(.y))
    }
    
    func testBottomToTopDiagonalFirstPlayerWin() {
        let boardEngine = DefaultBoardEngine(size: 3)
        
        let firstMove = boardEngine.doMove(columnNumber: 0, rowNumber: 2, player: .x)
        let secondMove = boardEngine.doMove(columnNumber: 0, rowNumber: 1, player: .y)
        let thirdMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .x)
        let fourthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .y)
        let fifthMove = boardEngine.doMove(columnNumber: 2, rowNumber: 0, player: .x)
        
        XCTAssertEqual(firstMove, .onGoing)
        XCTAssertEqual(secondMove, .onGoing)
        XCTAssertEqual(thirdMove, .onGoing)
        XCTAssertEqual(fourthMove, .onGoing)
        XCTAssertEqual(fifthMove, .won(.x))
    }
    
    func testBottomToTopDiagonalSecondPlayerWin() {
        let boardEngine = DefaultBoardEngine(size: 3)
        
        let firstMove = boardEngine.doMove(columnNumber: 0, rowNumber: 1, player: .x)
        let secondMove = boardEngine.doMove(columnNumber: 0, rowNumber: 2, player: .y)
        let thirdMove = boardEngine.doMove(columnNumber: 0, rowNumber: 2, player: .x)
        let fourthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .y)
        let fifthMove = boardEngine.doMove(columnNumber: 2, rowNumber: 1, player: .x)
        let sixthMove = boardEngine.doMove(columnNumber: 2, rowNumber: 0, player: .y)
        
        XCTAssertEqual(firstMove, .onGoing)
        XCTAssertEqual(secondMove, .onGoing)
        XCTAssertEqual(thirdMove, .onGoing)
        XCTAssertEqual(fourthMove, .onGoing)
        XCTAssertEqual(fifthMove, .onGoing)
        XCTAssertEqual(sixthMove, .won(.y))
    }
    
    func testDraw() {
        let boardEngine = DefaultBoardEngine(size: 3)
        
        let firstMove = boardEngine.doMove(columnNumber: 0, rowNumber: 1, player: .x)
        let secondMove = boardEngine.doMove(columnNumber: 0, rowNumber: 2, player: .y)
        let thirdMove = boardEngine.doMove(columnNumber: 0, rowNumber: 3, player: .x)
        let fourthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 1, player: .y)
        let fifthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 2, player: .x)
        let sixthMove = boardEngine.doMove(columnNumber: 1, rowNumber: 3, player: .y)
        let seventhMove = boardEngine.doMove(columnNumber: 2, rowNumber: 0, player: .x)
        let eightMove = boardEngine.doMove(columnNumber: 2, rowNumber: 1, player: .y)
        let ninthMove = boardEngine.doMove(columnNumber: 2, rowNumber: 2, player: .x)
        
        XCTAssertEqual(firstMove, .onGoing)
        XCTAssertEqual(secondMove, .onGoing)
        XCTAssertEqual(thirdMove, .onGoing)
        XCTAssertEqual(fourthMove, .onGoing)
        XCTAssertEqual(fifthMove, .onGoing)
        XCTAssertEqual(sixthMove, .onGoing)
        XCTAssertEqual(seventhMove, .onGoing)
        XCTAssertEqual(eightMove, .onGoing)
        XCTAssertEqual(ninthMove, .draw)
    }
}
