//
//  DatasourceJokesCollection.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import UIKit

final class DatasourceJokesCollection: NSObject, UICollectionViewDataSource {
    
    // MARK: - Private Properties
    private let viewModel: DetailViewModel
    
    // MARK: - Internal Init
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Datasource Protocol Implementation
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: JokeImageCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: JokeImageCollectionCell.cellIdentifier, for: indexPath) as? JokeImageCollectionCell else {
            return UICollectionViewCell()
        }
        viewModel.currentCell = indexPath.item
        cell.set(viewModel: viewModel)
        return cell
    }
    
    
}
