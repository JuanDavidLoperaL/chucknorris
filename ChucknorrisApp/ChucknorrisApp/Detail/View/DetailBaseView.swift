//
//  DetailBaseView.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import SnapKit
import DesignSystem
import UIKit

final class DetailBaseView: UIView {
    
    // MARK: - Private UI Properties
    private let iconImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        return imageView
    }()
    
    private let categoriesLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.apply(style: .h2Medium(align: .center, color: .body))
        return label
    }()
    
    private let createdAtLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.apply(style: .h2Medium(align: .center, color: .body))
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.apply(style: .h2Regular(align: .left, color: .body))
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let memeLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h3Regular(align: .left, color: .body))
        return label
    }()
    
    private let jokesCollectionView: UICollectionView = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(JokeImageCollectionCell.self, forCellWithReuseIdentifier: JokeImageCollectionCell.cellIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Private Properties
    private var datasourceCollection: DatasourceJokesCollection?
    private var delegateCollection: DelegateJokesCollection?
    
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
extension DetailBaseView: ViewConfigurationProtocol {
    func setupViewHierarchy() {
        [iconImage, createdAtLabel, categoriesLabel, descriptionLabel, jokesCollectionView, memeLabel].forEach { view in
            addSubview(view)
        }
    }
    
    func setupConstraints() {
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(10.0)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(70.0)
            make.width.equalTo(70.0)
        }
        
        createdAtLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(15.0)
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
            make.height.equalTo(50.0)
        }
        
        categoriesLabel.snp.makeConstraints { make in
            make.top.equalTo(createdAtLabel.snp.bottom).offset(10.0)
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
            make.height.equalTo(50.0)
        }
        
        jokesCollectionView.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottomMargin).offset(-20.0)
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
            make.height.equalTo(130.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(categoriesLabel.snp.bottom).offset(15.0)
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
            make.bottom.equalTo(jokesCollectionView.snp.top).offset(-12.0)
        }
        
        memeLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
            make.bottom.equalTo(jokesCollectionView.snp.top).offset(-10.0)
        }
    }
    
    func configureViews() {
        self.apply(background: .mainScreen)
    }
}

// MARK: - Internal Function
extension DetailBaseView {
    func set(viewModel: DetailViewModel) {
        memeLabel.text = AppText.Detail.meme
        iconImage.load(url: viewModel.icon)
        categoriesLabel.text = viewModel.categories
        createdAtLabel.text = viewModel.createdAt
        descriptionLabel.text = viewModel.description
        datasourceCollection = DatasourceJokesCollection(viewModel: viewModel)
        delegateCollection = DelegateJokesCollection()
        jokesCollectionView.dataSource = datasourceCollection
        jokesCollectionView.delegate = delegateCollection
        jokesCollectionView.reloadData()
    }
}
