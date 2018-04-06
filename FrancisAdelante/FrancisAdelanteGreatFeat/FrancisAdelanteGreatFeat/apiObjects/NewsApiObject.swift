//
//  NewsApiObject.swift
//  FrancisAdelanteGreatFeat
//
//  Created by Francis Adelante on 4/5/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class NewsApiObject: BaseApiObject {
    func fetchNews(completion: @escaping APICompletionHandler){
        let url = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=da6735fd52b04ca88390f508201518e9"
        
        apiRequest(endPoint: url) { (response, error) in
            
            var apiResponse = ApiResponse()
            
            guard error == nil else {
                apiResponse.apiStatus = APIStatus.apiError
                apiResponse.error = error
                completion(apiResponse)
                return
            }
            
            guard let responseObject = response as? [String: AnyObject] else {
                apiResponse.apiStatus = APIStatus.apiFail
                apiResponse.error = NSError.makeError(appErrorDomain: AppError.ParseError.code)
                completion(apiResponse)
                return
            }
            
            if let articles = responseObject["articles"] as? [AnyObject] {
                
                for article in articles {
                    guard let articleObject = article as? [String: AnyObject] else {
                        continue
                    }
                    News.newsObjectWithData(newsData: articleObject)
                }
            }
            
            
            DataManager.shared.saveChanges()
            
            apiResponse.apiStatus = APIStatus.apiSuccess
            apiResponse.data = responseObject
            completion(apiResponse)
        }
    }
}
