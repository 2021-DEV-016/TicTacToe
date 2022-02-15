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
    private var boardEngine: MockBoardEngine!
    private var boardViewModel: BoardViewModel!
    
    private var didShowAlert: Bool = false
    private var didCreateBoard: Bool = false
    private var didDisableBoard: Bool = false
    private var turnLabelText: String? = nil
    
    override func setUp() {
        super.setUp()

        let configuration = BoardConfiguration(firstPlayer: .x, size: 3)
        let moves = [Move(columnNumber: 0, rowNumber: 0, player: .x), Move(columnNumber: 1, rowNumber: 1, player: .y)]
        boardEngine = MockBoardEngine(moves: moves)
        boardViewModel = BoardViewModel(boardEngine: boardEngine, configuration: configuration)
        boardViewModel.delegate = self
        
        boardViewModel.createBoard = { [weak self] _ in
            self?.didCreateBoard = true
        }
        
        boardViewModel.disableBoard = { [weak self] bool in
            self?.didDisableBoard = bool
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
        boardViewModel = BoardViewModel(boardEngine: boardEngine, configuration: BoardConfiguration(firstPlayer: .x, size: 3))
        
        boardViewModel.turnLabelText = { [weak self] text in
            self?.turnLabelText = text
        }
        
        boardViewModel.viewDidLoad()
        XCTAssertEqual(turnLabelText, "Turn player: X")
    }
    
    func testFirstPlayerIsY() {
        boardViewModel = BoardViewModel(boardEngine: boardEngine, configuration: BoardConfiguration(firstPlayer: .y, size: 3))
        
        boardViewModel.turnLabelText = { [weak self] text in
            self?.turnLabelText = text
        }
        
        boardViewModel.viewDidLoad()
        XCTAssertEqual(turnLabelText, "Turn player: 0")
    }
    
    func testDidTapBoardSquareAlert() {
        XCTAssertFalse(didShowAlert)
        
        boardViewModel.didTapBoardSquare(view: BoardSquareView(), columnNumber: 80, rowNumber: 80)
        
        XCTAssertTrue(didShowAlert)
    }
    
    func testDidTapResetButton() {
        didDisableBoard = true
        XCTAssertFalse(didCreateBoard)
        XCTAssertEqual(boardEngine.moves.count, 2)
        
        boardViewModel.didTapResetButton()
        
        XCTAssertEqual(boardEngine.moves.count, 0)
        XCTAssertTrue(didCreateBoard)
        XCTAssertFalse(didDisableBoard)
    }
}

extension BoardViewModelTests: BoardViewModelDelegate {
    func mustShowAlert(_ viewModel: BoardViewModel, alert: Alert) {
        didShowAlert = true
    }
}
