//
//  DetailViewController.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let baseView: DetailBaseView = DetailBaseView()
    
    // MARK: - Private Properties
    private let viewModel: DetailViewModel
    private let coordinator: AppCoordinator
    
    // MARK: - Internal Init
    init(coordinator: AppCoordinator,
         viewModel: DetailViewModel) {
        self.coordinator = coordinator
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
        baseView.set(viewModel: viewModel)
        self.title = AppText.Detail.title
    }
}
