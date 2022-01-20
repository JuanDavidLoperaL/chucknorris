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
    // MARK: - Private UI Properties
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h1Medium(align: .center, color: .black))
        return label
    }()
    
    private let informationTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    // MARK: - Private Properties
    private var datasourceTable: DatasourceInformationTable?
    private var delegateTable: DelegateInformationTable?
    
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
        [titleLabel, informationTableView].forEach { view in
            addSubview(view)
        }
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(20.0)
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
        }
        
        informationTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottomMargin)
        }
    }
    
    func configureViews() {
        self.apply(background: .mainScreen)
    }
}

// MARK: - Internal Function
extension HomeBaseView {
    func set(viewModel: HomeViewModel) {
        titleLabel.text = viewModel.title
        datasourceTable = DatasourceInformationTable(viewModel: viewModel)
        delegateTable = DelegateInformationTable(viewModel: viewModel)
        informationTableView.dataSource = datasourceTable
        informationTableView.delegate = delegateTable
        informationTableView.reloadData()
    }
    
    func reloadTableView() {
        informationTableView.reloadData()
    }
}
