//
//  JokeImageCollectionCell.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 21/01/22.
//

import DesignSystem
import UIKit

final class JokeImageCollectionCell: UICollectionViewCell {
    
    // MARK: - Private UI Properties
    private let imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Static Properties
    static let cellIdentifier: String = "JokeImageCell"
    
    // MARK: - Internal Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode
extension JokeImageCollectionCell: ViewConfigurationProtocol {
    func setupViewHierarchy() {
        contentView.addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    func configureViews() {
        contentView.apply(background: .clear)
    }
}

// MARK: - Internal Function
extension JokeImageCollectionCell {
    func set(viewModel: DetailViewModel) {
        imageView.image = UIImage(named: viewModel.jokeImage)
    }
}
