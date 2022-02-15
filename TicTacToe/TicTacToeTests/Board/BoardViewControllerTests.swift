//
//  BoardViewControllerTests.swift
//  TicTacToeTests
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit
import XCTest
@testable import TicTacToe

class BoardViewControllerTests: XCTestCase {
    private var boardViewController: BoardViewController!
    private let viewModel = BoardViewModel(boardEngine: MockBoardEngine(), configuration: BoardConfiguration(firstPlayer: .x, size: 3))
    
    override func setUp() {
        super.setUp()
        
        boardViewController = BoardViewController(viewModel: viewModel)
    }
    
    override func tearDown() {
        boardViewController = nil
        
        super.tearDown()
    }
    
    func testViewControllerNotNil() {
        XCTAssertNotNil(boardViewController)
    }
    
    func testDisableBoard() {
        viewModel.disableBoard?(true)
        
        let view = boardViewController.view.subviews.filter({ $0 is BoardView }).first as? BoardView
        
        XCTAssertEqual(view?.isUserInteractionEnabled, false)
        
        viewModel.disableBoard?(false)
        
        XCTAssertEqual(view?.isUserInteractionEnabled, true)
    }
}
