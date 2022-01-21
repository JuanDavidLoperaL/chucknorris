//
//  HomeViewController.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import Foundation
import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func setValueInLoader(track: CGFloat)
    func informationLoadedWithSucess()
    func errorLoadingInformation()
    func selected(joke: JokesResult)
}

final class HomeViewController: UIViewController {
    
    typealias screenText = AppText.Home
    
    // MARK: - Private UI Properties
    private let baseView: HomeBaseView = HomeBaseView()
    
    // MARK: - Private Properties
    private let viewModel: HomeViewModel
    
    // MARK: - Internal Init
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        baseView.set(viewModel: viewModel)
        baseView.set(viewModel: viewModel)
        getInformation()
    }
}

// MARK: - WelcomeViewController Protocol Implementation
extension HomeViewController: HomeViewControllerDelegate {
    func setValueInLoader(track: CGFloat) {
        baseView.showLoader(with: track)
    }
    
    func informationLoadedWithSucess() {
        baseView.loaderFinished(withError: false)
    }
    
    func errorLoadingInformation() {
        baseView.loaderFinished(withError: true)
    }
    
    func selected(joke: JokesResult) {
        print("selected: \(joke)")
    }
}

// MARK: - Private Function
private extension HomeViewController {
    func getInformation() {
        viewModel.startPercentLoader()
        viewModel.getJokes { [weak self] result in
            if result {
                self?.baseView.reloadCollectionView()
            } else {
                self?.showAlertError()
            }
        }
    }
    
    func showAlertError() {
        let alert: UIAlertController = UIAlertController(title: screenText.alertErrorTitle,
                                                         message: "Main Problmen: \(viewModel.httpError ?? .genericError)\n\n\(screenText.alertErrorMessage)",
                                                         preferredStyle: .alert)
        let tryAgainAction: UIAlertAction = UIAlertAction(title: screenText.alertTryAgainAction, style: .default) { _ in
            self.getInformation()
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: screenText.alertCancelButton, style: .destructive, handler: nil)
        [tryAgainAction, cancelAction].forEach { action in
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}
