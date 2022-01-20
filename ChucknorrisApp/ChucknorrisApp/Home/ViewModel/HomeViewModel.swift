//
//  HomeViewModel.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import UIKit

final class HomeViewModel {
    
    // MARK: - Internal Properties
    var cellSelected: Int = 0
    var currentCell: Int = 0
    
    // MARK: - Internal Init
    init() {
    }
    
    // MARK: - Computed Properties
    var title: String {
        return ""
    }
    
    var numberOfRowInSection: Int {
        return 0
    }
    
    var descriptionForRow: String {
        return ""
    }
    
    var categories: String {
        return ""
    }
    
    var icon: UIImage {
        return UIImage()
    }
}

// MARK: - Internal Function
extension HomeViewModel {
    func getJokes() {
        
    }
}
