//
//  HomeViewModelTest.swift
//  ChucknorrisAppTests
//
//  Created by Juan David Lopera Lopez on 21/01/22.
//

import XCTest
import Foundation
@testable import ChucknorrisApp

final class HomeViewModelTest: XCTestCase {
    
    var viewModel: HomeViewModel!
    var api: HomeAPIMock!
    
    override func setUpWithError() throws {
        api = HomeAPIMock()
        viewModel = HomeViewModel(api: api)
    }
    
    func testTitleComputedProperty() {
        XCTAssertEqual(viewModel.title, AppText.Home.appTitle)
    }
    
    func testNumberOfItemsInSectionComputedProperty() {
        api.withError = false
        viewModel.getJokes { result in
            XCTAssertTrue(result)
            XCTAssertEqual(self.viewModel.numberOfItemsInSection, JokesResult.getMockArray().count)
        }
    }
    
    func testDescriptionForRowComputedProperty() {
        api.withError = false
        viewModel.currentCell = 0
        viewModel.getJokes { result in
            XCTAssertTrue(result)
            XCTAssertEqual(self.viewModel.descriptionForRow, JokesResult.getMockArray()[0].description)
        }
    }
    
    func testGetJokesWithError() {
        api.withError = true
        viewModel.getJokes { result in
            XCTAssertFalse(result)
            XCTAssertNotNil(self.viewModel.httpError)
        }
    }
    
    func testGetJokesWithoutError() {
        api.withError = false
        viewModel.getJokes { result in
            XCTAssertTrue(result)
            XCTAssertNil(self.viewModel.httpError)
        }
    }
}
