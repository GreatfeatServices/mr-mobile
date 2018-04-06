//
//  ApiManager.swift
//  FrancisAdelanteGreatFeat
//
//  Created by Francis Adelante on 4/5/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit


enum APIStatus {
    case apiSuccess // ** Expected response parsed correctly.
    case apiFail // ** Backend framework error or invalid URL
    case apiError // ** Connection errors such as no internet, or connection timeout
    
}

struct ApiResponse {
    var apiStatus: APIStatus?
    var error: Error?
    var data: Any?
}

typealias InternalAPICompletionHandler = (_ responseObject: AnyObject?, _ error: Error?) -> Void
typealias APICompletionHandler = (_ apiResponse: ApiResponse) -> Void

class ApiManager: NSObject {
    
    static let shared = ApiManager()
    
    lazy var news: NewsApiObject = {
        return NewsApiObject()
    }()
    
}
