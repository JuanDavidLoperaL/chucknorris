//
//  DatasourceInformationTable.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import UIKit

final class DatasourceInformationTable: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    private let viewModel: HomeViewModel
    
    // MARK: - Internal Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Datasource Protocol Implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: JokesTableViewCell = tableView.dequeueReusableCell(withIdentifier: JokesTableViewCell.cellIdentifier, for: indexPath) as? JokesTableViewCell else {
            return UITableViewCell()
        }
        cell.set(viewModel: viewModel)
        return cell
    }
}
