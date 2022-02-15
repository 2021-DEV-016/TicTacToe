//
//  BoardCoordinator.swift
//  TicTacToe
//
//  Created by Laurens Wuyts on 15/02/2022.
//

import Foundation
import UIKit

final class BoardCoordinator {
    
    // MARK: - Internal
    
    private var rootViewController: UIViewController?
    
    // MARK: - Public
    
    func start() -> UIViewController {
        let boardConfiguration = BoardConfiguration(firstPlayer: .x, size: 3)
        let boardEngine = DefaultBoardEngine(size: boardConfiguration.size)
        
        let viewModel = BoardViewModel(boardEngine: boardEngine, configuration: boardConfiguration)
        let viewController = BoardViewController(viewModel: viewModel)
        
        self.rootViewController = viewController
        
        return viewController
    }
}
