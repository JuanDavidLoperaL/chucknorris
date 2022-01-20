//
//  DelegateInformationTable.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import Foundation
import UIKit

final class DelegateInformationTable: NSObject, UITableViewDelegate {
    
    // MARK: - Private Properties
    private let viewModel: HomeViewModel
    
    // MARK: - Internal Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Delegate Protocol Implementation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.cellSelected = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
