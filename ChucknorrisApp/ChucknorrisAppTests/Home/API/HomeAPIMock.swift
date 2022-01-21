//
//  HomeAPIMock.swift
//  ChucknorrisAppTests
//
//  Created by Juan David Lopera Lopez on 21/01/22.
//

import APIManager
import Foundation
@testable import ChucknorrisApp

final class HomeAPIMock: HomeAPIProtocol {
    var withError: Bool = false
    
    func getInformation(callback: @escaping (Result<Jokes?, HttpError>) -> Void) {
        if withError {
            let error: HttpError = HttpError.genericError
            callback(.failure(error))
        } else {
            let jokes = Jokes(result: JokesResult.getMockArray())
            callback(.success(jokes))
        }
    }
}
