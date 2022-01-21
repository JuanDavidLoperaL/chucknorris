//
//  DatasourceInformationCollection.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import UIKit

final class DatasourceInformationCollection: NSObject, UICollectionViewDataSource {
    
    // MARK: - Private Properties
    private let viewModel: HomeViewModel
    
    // MARK: - Internal Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Datasource Protocol Implementation
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: JokesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: JokesCollectionViewCell.cellIdentifier, for: indexPath) as? JokesCollectionViewCell else {
            return UICollectionViewCell()
        }
        viewModel.currentCell = indexPath.row
        cell.set(viewModel: viewModel)
        return cell
    }
}
