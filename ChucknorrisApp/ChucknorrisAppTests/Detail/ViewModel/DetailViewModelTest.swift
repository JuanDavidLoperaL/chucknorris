//
//  DetailViewModelTest.swift
//  ChucknorrisAppTests
//
//  Created by Juan David Lopera Lopez on 21/01/22.
//

import Foundation
import XCTest
@testable import ChucknorrisApp

final class DetailViewModelTest: XCTestCase {
    
    var viewModel: DetailViewModel!
    
    override func setUpWithError() throws {
        viewModel = DetailViewModel(joke: JokesResult.getMockArray()[0])
    }
    
    func testDescriptionComputedProperty() {
        XCTAssertEqual(viewModel.description, "Description:\n\(JokesResult.getMockArray()[0].description)")
    }
    
    func testCreatedAtComputedProperty() {
        XCTAssertEqual(viewModel.createdAt, "This joke was created at:\n\(JokesResult.getMockArray()[0].createdAt)")
    }
    
    func testNumberOfImagesComputedProperty() {
        XCTAssertEqual(viewModel.numberOfImages, 5)
    }
}
