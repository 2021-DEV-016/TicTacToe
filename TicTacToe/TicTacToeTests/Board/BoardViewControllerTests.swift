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
    private let configuration = BoardConfiguration(firstPlayer: .x, size: 3)
    private let viewModel = BoardViewModel(configuration: configuration)
    
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
}
