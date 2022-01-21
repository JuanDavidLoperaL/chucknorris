//
//  JokeResult.swift
//  ChucknorrisAppTests
//
//  Created by Juan David Lopera Lopez on 21/01/22.
//

import Foundation
@testable import ChucknorrisApp

extension JokesResult {
    static func getMockArray() -> [JokesResult] {
        let jokeOne: JokesResult = JokesResult(categories: ["Movies"], iconUrl: "www.test.com", description: "This a description test with Sport Movies", createdAt: "2022-01-21")
        let jokeTwo: JokesResult = JokesResult(categories: ["Art"], iconUrl: "www.test.com", description: "This a description test with Art category", createdAt: "2022-01-21")
        let jokeThree: JokesResult = JokesResult(categories: ["Sport"], iconUrl: "www.test.com", description: "This a description test with Sport category", createdAt: "2022-01-21")
        let jokeFour: JokesResult = JokesResult(categories: ["Social Media"], iconUrl: "www.test.com", description: "This a description test with Social Media category", createdAt: "2022-01-21")
        return [jokeOne, jokeTwo, jokeThree, jokeFour]
    }
}
