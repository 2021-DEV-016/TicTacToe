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
    
    override func setUp() {
        super.setUp()

        boardViewModel = BoardViewModel()
    }
    
    override func tearDown() {
        boardViewModel = nil
        
        super.tearDown()
    }
}
