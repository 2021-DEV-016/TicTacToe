//
//  UIStackView+Subviews.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach({ addArrangedSubview($0) })
    }
    
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
