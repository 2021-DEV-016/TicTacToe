//
//  UIStackView+SubviewsTests.swift
//  TicTacToeTests
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit
import XCTest
@testable import TicTacToe

class UIStackViewSubviewsTests: XCTestCase {
    
    func testAddArrangedSubviews() {
        let stackView = UIStackView()
        XCTAssertEqual(stackView.arrangedSubviews.count, 0)
        stackView.addArrangedSubviews([UIView(), UIView(), UIView()])
        XCTAssertNotEqual(stackView.arrangedSubviews.count, 2)
        XCTAssertEqual(stackView.arrangedSubviews.count, 3)
        XCTAssertNotEqual(stackView.arrangedSubviews.count, 4)
    }
    
    func testRemoveArrangedSubviews() {
        let stackView = UIStackView()
        stackView.addArrangedSubviews([UIView(), UIView(), UIView()])
        XCTAssertEqual(stackView.arrangedSubviews.count, 3)
        
        stackView.removeAllArrangedSubviews()
        XCTAssertNotEqual(stackView.arrangedSubviews.count, 3)
        XCTAssertEqual(stackView.arrangedSubviews.count, 0)
    }
}
