//
//  AppCoordinator.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    // MARK: - Private Properties
    private let navigationController: UINavigationController
    
    // MARK: - Internal Init
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal Function
    func start() -> UINavigationController {
        let viewController: HomeViewController = HomeViewController(coordinator: self)
        self.navigationController.setViewControllers([viewController], animated: true)
        return self.navigationController
    }
    
    func navigateToDetail(with joke: JokesResult) {
        let viewModel: DetailViewModel = DetailViewModel(joke: joke)
        let viewController: DetailViewController = DetailViewController(coordinator: self, viewModel: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
