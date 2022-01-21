//
//  DetailViewModel.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import Foundation

final class DetailViewModel {
    
    // MARK: - Private Properties
    private(set) var joke: JokesResult
    private let imagesNames: [String] = ["workSaturday", "notSure", "mathBeLike", "googleWork", "alies"]
    
    // MARK: - Internal Properties
    var currentCell: Int = 0
    
    // MARK: - Internal Init
    init(joke: JokesResult) {
        self.joke = joke
    }
    
    // MARK: - Computed Properties
    var description: String {
        return "Description:\n\(joke.description)"
    }
    
    var categories: String {
        var categories: String = String()
        joke.categories.forEach { category in
            if categories.isEmpty {
                categories = category
            } else {
                categories = "\(categories) - \(category)"
            }
        }
        return "Categories:\n\(categories)"
    }
    
    var icon: URL {
        guard let url: URL = URL(string: joke.iconUrl) else {
            return URL(fileURLWithPath: "")
        }
        return url
    }
    
    var createdAt: String {
        guard let created = joke.createdAt.components(separatedBy: " ").first else {
            return String()
        }
        return "This joke was created at:\n\(created)"
    }
    
    var numberOfImages: Int {
        return imagesNames.count
    }
    
    var jokeImage: String {
        guard imagesNames.indices.contains(currentCell) else {
            return String()
        }
        return imagesNames[currentCell]
    }
}
