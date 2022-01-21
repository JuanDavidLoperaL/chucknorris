//
//  HomeBaseView.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import DesignSystem
import SnapKit
import UIKit

final class HomeBaseView: UIView {
    
    typealias screenText = AppText.Home
    
    // MARK: - Private UI Properties
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h1Medium(align: .center, color: .black))
        return label
    }()
    
    private let informationCollectionView: UICollectionView = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(JokesCollectionViewCell.self, forCellWithReuseIdentifier: JokesCollectionViewCell.cellIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let loader: LoaderBaseView = LoaderBaseView()
    
    // MARK: - Private Properties
    private var datasourceCollection: DatasourceInformationCollection?
    private var delegateCollection: DelegateInformationCollection?
    
    // MARK: - Internal Init
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode
extension HomeBaseView: ViewConfigurationProtocol {
    func setupViewHierarchy() {
        [titleLabel, informationCollectionView, loader].forEach { view in
            addSubview(view)
        }
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(20.0)
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
        }
        
        informationCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottomMargin)
        }
        
        loader.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    func configureViews() {
        self.apply(background: .mainScreen)
        loader.setLoader(message: screenText.downloadMessage)
    }
}

// MARK: - Internal Function
extension HomeBaseView {
    func set(viewModel: HomeViewModel) {
        titleLabel.text = viewModel.title
        datasourceCollection = DatasourceInformationCollection(viewModel: viewModel)
        delegateCollection = DelegateInformationCollection(viewModel: viewModel)
        informationCollectionView.dataSource = datasourceCollection
        informationCollectionView.delegate = delegateCollection
        informationCollectionView.reloadData()
    }
    
    func reloadCollectionView() {
        informationCollectionView.reloadData()
    }
    
    func showLoader(with trackValue: CGFloat) {
        loader.showLoader(with: trackValue)
    }
    
    func hideLoader() {
        loader.isHidden = true
        loader.alpha = 0.0
    }
    
    func loaderFinished(withError: Bool) {
        if withError {
            loader.finishWithError()
        } else {
            loader.finish()
        }
    }
}
