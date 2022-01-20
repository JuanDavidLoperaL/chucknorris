//
//  HomeViewController.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    
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
        baseView.set(viewModel: viewModel)
    }
    
}
