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
    
    private let turnLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
    
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
        
        viewModel.disableBoard = { [weak self] bool in
            self?.boardView.isUserInteractionEnabled = !bool
        }
        
        viewModel.turnLabelText = { [weak self] text in
            self?.turnLabel.text = text
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(turnLabel)
        view.addSubview(boardView)
        
        turnLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        turnLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        turnLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                
        boardView.topAnchor.constraint(equalTo: turnLabel.bottomAnchor, constant: 30).isActive = true
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
