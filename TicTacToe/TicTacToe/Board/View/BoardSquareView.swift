//
//  BoardSquareView.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit

final class BoardSquareView: UIButton {
    
    // MARK: - Public Vars
    
    var didTapSquare: (() -> Void)?
    
    // MARK: - Views
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupViews() {
        backgroundColor = .white
        
        addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
    }
    
    // MARK: - Public
    
    func setTitle(_ title: String) {
        label.text = title
        
        // Player can only click on square once
        isUserInteractionEnabled = false
    }
    
    // MARK: - Selector
    
    @objc func didTap(_ sender: AnyObject) {
        didTapSquare?()
    }
}
