//
//  BoardCoordinatorTests.swift
//  TicTacToeTests
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit
import XCTest
@testable import TicTacToe

class BoardCoordinatorTests: XCTestCase {
    private var boardCoordinator: BoardCoordinator!
    
    override func setUp() {
        super.setUp()
        
        boardCoordinator = BoardCoordinator()
    }
    
    override func tearDown() {
        boardCoordinator = nil
        
        super.tearDown()
    }
    
    func testCoordinatorNotNil() {
        XCTAssertNotNil(boardCoordinator)
    }
    
    func testStart() {
        let viewController = boardCoordinator.start()
        XCTAssert(viewController.isKind(of: BoardViewController.self))
    }
}
