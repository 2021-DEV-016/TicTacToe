//
//  BoardView.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit

protocol BoardViewDelegate: AnyObject {
    func didTapBoardSquare(_ view: BoardSquareView, columnNumber: Int, rowNumber: Int)
}

final class BoardView: UIView {
    
    // MARK: - Delegate
    
    weak var delegate: BoardViewDelegate?
    
    // MARK: - Views
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.backgroundColor = .black
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupView() {
        addSubview(mainStackView)
        
        mainStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    // MARK: - Public
    
    func setup(size: Int) {
        mainStackView.removeAllArrangedSubviews()
        
        let horizontalStackViews: [UIStackView] = [Int](0...size - 1).map { rowNumber in
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            horizontalStackView.distribution = .fillEqually
            horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
            horizontalStackView.spacing = 5
            
            let boardSquareViews: [BoardSquareView] = [Int](0...size - 1).map { columnNumber in
                let boardSquareView = BoardSquareView()
                boardSquareView.translatesAutoresizingMaskIntoConstraints = false
                
                boardSquareView.didTapSquare = { [weak self] in
                    guard let self = self else { return }
                    
                    self.delegate?.didTapBoardSquare(boardSquareView, columnNumber: columnNumber, rowNumber: rowNumber)
                }
                
                return boardSquareView
            }

            horizontalStackView.addArrangedSubviews(boardSquareViews)
            
            return horizontalStackView
        }
        
        mainStackView.addArrangedSubviews(horizontalStackViews)
    }
}
