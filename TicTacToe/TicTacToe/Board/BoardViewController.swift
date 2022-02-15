//
//  BoardViewController.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit

class BoardViewController: UIViewController {
    
    // MARK: - Internals
    
    private let viewModel: BoardViewModel
    
    // MARK: - Init
    
    init(viewModel: BoardViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupViews() {
        view.backgroundColor = .white
    }
}
