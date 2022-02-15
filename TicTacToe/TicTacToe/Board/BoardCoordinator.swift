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
        viewModel.delegate = self
        let viewController = BoardViewController(viewModel: viewModel)
        
        self.rootViewController = viewController
        
        return viewController
    }
}

// MARK: - BoardViewModelDelegate

extension BoardCoordinator: BoardViewModelDelegate {
    
    func mustShowAlert(_ viewModel: BoardViewModel, alert: Alert) {
        let alertController = UIAlertController(title: alert.title, message: alert.description, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: alert.button, style: .default, handler: { _ in
            alertController.dismiss(animated: true, completion: nil)
        }))

        rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
