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
        let viewModel = BoardViewModel()
        let viewController = BoardViewController(viewModel: viewModel)
        
        self.rootViewController = viewController
        
        return viewController
    }
}
