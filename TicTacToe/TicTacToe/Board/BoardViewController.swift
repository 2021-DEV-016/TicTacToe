//
//  BoardViewController.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit

class BoardViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var boardView: BoardView = {
        let boardView = BoardView()
        boardView.translatesAutoresizingMaskIntoConstraints = false
        boardView.delegate = self
        return boardView
    }()
    
    // MARK: - Internals
    
    private let viewModel: BoardViewModel
    
    // MARK: - Init
    
    init(viewModel: BoardViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        setupBindings()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private
    
    private func setupBindings() {
        viewModel.createBoard = { [weak self] size in
            self?.boardView.setup(size: size)
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(boardView)
                
        boardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        boardView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        boardView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        boardView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
    }
}

// MARK: - BoardViewDelegate

extension BoardViewController: BoardViewDelegate {
    
    func didTapBoardSquare(_ view: BoardSquareView, columnNumber: Int, rowNumber: Int) {
        viewModel.didTapBoardSquare(view: view, columnNumber: columnNumber, rowNumber: rowNumber)
    }
}
