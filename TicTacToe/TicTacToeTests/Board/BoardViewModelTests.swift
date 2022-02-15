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
    
    override func setUp() {
        super.setUp()

        let configuration = BoardConfiguration(size: 3)
        boardViewModel = BoardViewModel(configuration: configuration)
        
        boardViewModel.createBoard = { [weak self] _ in
            self?.didCreateBoard = true
        }
    }
    
    override func tearDown() {
        boardViewModel = nil
        
        super.tearDown()
    }
    
    func testViewDidLoad() {
        XCTAssertFalse(didCreateBoard)
        
        boardViewModel.viewDidLoad()
        
        XCTAssertTrue(didCreateBoard)
    }
}
