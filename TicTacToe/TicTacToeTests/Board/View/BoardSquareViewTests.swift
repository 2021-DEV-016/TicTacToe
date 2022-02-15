//
//  BoardSquareViewTests.swift
//  TicTacToeTests
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit
import XCTest
@testable import TicTacToe

class BoardSquareViewTests: XCTestCase {
    private var boardSquareView: BoardSquareView!
    
    override func setUp() {
        super.setUp()
        
        boardSquareView = BoardSquareView()
    }
    
    override func tearDown() {
        boardSquareView = nil
        
        super.tearDown()
    }
    
    func testViewNotNil() {
        XCTAssertNotNil(boardSquareView)
    }
    
    func testUserInteractionEnabled() {
        XCTAssertTrue(boardSquareView.isUserInteractionEnabled)
        boardSquareView.setTitle("a")
        XCTAssertFalse(boardSquareView.isUserInteractionEnabled)
    }
}
