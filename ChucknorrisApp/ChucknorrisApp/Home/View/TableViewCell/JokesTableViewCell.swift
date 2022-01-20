//
//  JokesTableViewCell.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import DesignSystem
import Foundation
import UIKit

final class JokesTableViewCell: UITableViewCell {
    
    // MARK: - Private UI Properties
    private let iconImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        return imageView
    }()
    
    private let categoriesLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h2Regular(align: .left, color: .body))
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h2Regular(align: .left, color: .body))
        return label
    }()
    
    // MARK: - Static Properties
    static let cellIdentifier: String = "JokeCell"
    
    // MARK: - Internal Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode
extension JokesTableViewCell: ViewConfigurationProtocol {
    func setupViewHierarchy() {
        [iconImage, categoriesLabel, descriptionLabel].forEach { view in
            contentView.addSubview(view)
        }
    }
    
    func setupConstraints() {
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(30.0)
            make.leading.equalTo(contentView.snp.leading).offset(20.0)
            make.height.equalTo(50.0)
            make.width.equalTo(50.0)
        }
        
        categoriesLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(15.0)
            make.leading.equalTo(contentView.snp.leading).offset(20.0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20.0)
            make.height.equalTo(45.0)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(categoriesLabel.snp.bottom).offset(15.0)
            make.leading.equalTo(contentView.snp.leading).offset(20.0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20.0)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10.0)
        }
    }
    
    func configureViews() {
        contentView.apply(background: .mainScreen)
    }
}

// MARK: - Internal Function
extension JokesTableViewCell {
    func set(viewModel: HomeViewModel) {
        iconImage.image = viewModel.icon
        categoriesLabel.text = viewModel.categories
        descriptionLabel.text = viewModel.descriptionForRow
    }
}
