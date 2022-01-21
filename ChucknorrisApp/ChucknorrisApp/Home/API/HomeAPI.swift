//
//  HomeAPI.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import APIManager
import Foundation

protocol HomeAPIProtocol {
    func getInformation(callback: @escaping(Result<Jokes?, HttpError>) -> Void)
}

final class HomeAPI: HomeAPIProtocol {
    
    // MARK: - Enum Endpoints
    enum Endpoint: String {
        case jokes = "/jokes/search"
    }
    
    // MARK: - Private Properties
    private var baseURL: URLComponents
    private var apimanager: APIManager = APIManager()
    
    // MARK: - Internal Init
    init(baseURL: URLComponents = EnvironmentURLHandler.variable(key: .baseURL)) {
        self.baseURL = baseURL
    }
    
    func getInformation(callback: @escaping(Result<Jokes?, HttpError>) -> Void) {
        baseURL.path = "\(Endpoint.jokes.rawValue)"
        baseURL.queryItems = [URLQueryItem(name: "query", value: "movie")]
        guard
            let url: URL = baseURL.url
        else {
            fatalError("Error getting URL from URLComponent Function: \(#function)  -- code line: \(#line)")
        }
        apimanager.request(to: url, method: .get, completion: callback)
    }
}
