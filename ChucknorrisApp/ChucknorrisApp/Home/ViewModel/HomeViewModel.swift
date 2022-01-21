//
//  HomeViewModel.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import APIManager
import UIKit

final class HomeViewModel {
    
    typealias screenText = AppText.Home
    
    // MARK: - Private Properties
    private let api: HomeAPIProtocol
    private let downloadHundredPercent: CGFloat = 1.0
    private let downloadSixtyPercent: CGFloat = 0.6
    private let increaseDownloadInOnePercent: CGFloat = 0.01
    private var timer : Timer?
    private var trackValue: CGFloat = 0.0
    
    // MARK: - Internal Properties
    var currentCell: Int = 0
    private(set) var httpError: HttpError?
    private(set) var jokes: Jokes?
    var cellSelected: Int = 0 {
        didSet {
            guard let joke: JokesResult = jokes?.result[cellSelected] else {
                return
            }
            delegate?.selected(joke: joke)
        }
    }
    
    // MARK: - Delegate
    weak var delegate: HomeViewControllerDelegate?
    
    // MARK: - Internal Init
    init(api: HomeAPIProtocol = HomeAPI()) {
        self.api = api
    }
    
    // MARK: - Computed Properties
    var title: String {
        return screenText.appTitle
    }
    
    var numberOfItemsInSection: Int {
        return jokes?.result.count ?? 0
    }
    
    var descriptionForRow: String {
        guard let description: String = jokes?.result[currentCell].description else {
            return String()
        }
        return description
    }
    
    var categories: String {
        guard let categoriesArray: [String] = jokes?.result[currentCell].categories else {
            return String()
        }
        if categoriesArray.isEmpty {
            return screenText.notCategory
        }
        var categories: String = String()
        categoriesArray.forEach { category in
            if categories.isEmpty {
                categories = category
            } else {
                categories = "\(categories) - \(category)"
            }
        }
        return categories
    }
    
    var icon: URL {
        guard let iconURL: String = jokes?.result[currentCell].iconUrl,
              let url: URL = URL(string: iconURL) else {
            return URL(fileURLWithPath: "")
        }
        return url
    }
}

// MARK: - Internal Function
extension HomeViewModel {
    func getJokes(callback: @escaping(Bool) -> Void) {
        api.getInformation { [weak self] result in
            DispatchQueue.main.async {
                self?.timer?.invalidate()
                switch result {
                case .success(let jokesResponse):
                    self?.httpError = nil
                    self?.jokes = jokesResponse
                    self?.delegate?.informationLoadedWithSucess()
                    callback(true)
                case .failure(let error):
                    self?.jokes = nil
                    self?.httpError = error
                    self?.delegate?.errorLoadingInformation()
                    callback(false)
                }
            }
        }
    }
    
    func startPercentLoader() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            if self.trackValue >= self.downloadHundredPercent || self.trackValue >= self.downloadSixtyPercent {
                self.delegate?.setValueInLoader(track: self.trackValue)
                self.timer?.invalidate()
            } else {
                self.trackValue += self.increaseDownloadInOnePercent
                self.delegate?.setValueInLoader(track: self.trackValue)
            }
        })
    }
}
