//
//  Router.swift
//  RickAndMortyInfo
//
//  Created by Richmond Ko on 11/04/2018.
//  Copyright © 2018 Richmond Ko. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

enum Router: URLRequestConvertible {

    case getCharacters(page: Int?)

    static let baseURLString = "https://rickandmortyapi.com/api"

    private var method: HTTPMethod {
        switch self {
        case .getCharacters: return .get
        }
    }

    private var path: String {
        switch self {
        case .getCharacters(_):
            return "/character"
        }
    }


    // MARK: - URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        switch self {
        case .getCharacters(let page):
            if let page = page {
                let parameters: [String: Any] = [
                    "page": page
                ]
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            }
        }
        return urlRequest
    }

}
