//
//  BoardViewModelTests.swift
//  TicTacToeTests
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit
import XCTest
@testable import TicTacToe

class BoardViewModelTests: XCTestCase {
    private var boardViewModel: BoardViewModel!
    
    private var didCreateBoard: Bool = false
    private var turnLabelText: String? = nil
    
    override func setUp() {
        super.setUp()

        let configuration = BoardConfiguration(firstPlayer: .x, size: 3)
        boardViewModel = BoardViewModel(configuration: configuration)
        
        boardViewModel.createBoard = { [weak self] _ in
            self?.didCreateBoard = true
        }
        
        boardViewModel.turnLabelText = { [weak self] text in
            self?.turnLabelText = text
        }
    }
    
    override func tearDown() {
        boardViewModel = nil
        
        super.tearDown()
    }
    
    func testViewDidLoad() {
        XCTAssertFalse(didCreateBoard)
        XCTAssertNil(turnLabelText)
        
        boardViewModel.viewDidLoad()
        
        XCTAssertTrue(didCreateBoard)
        XCTAssertEqual(turnLabelText, "Turn player: X")
    }
    
    func testDidTapBoardSquare() {
        let view = BoardSquareView()
        
        boardViewModel.viewDidLoad()
        
        XCTAssertEqual(turnLabelText, "Turn player: X")
        
        boardViewModel.didTapBoardSquare(view: view, columnNumber: 0, rowNumber: 0)
        
        XCTAssertEqual(turnLabelText, "Turn player: 0")
    }
    
    func testFirstPlayerIsX() {
        boardViewModel = BoardViewModel(configuration: BoardConfiguration(firstPlayer: .x, size: 3))
        boardViewModel.viewDidLoad()
        XCTAssertEqual(turnLabelText, "Turn player: X")
    }
    
    func testFirstPlayerIsY() {
        boardViewModel = BoardViewModel(configuration: BoardConfiguration(firstPlayer: .y, size: 3))
        boardViewModel.viewDidLoad()
        XCTAssertEqual(turnLabelText, "Turn player: 0")
    }
}
