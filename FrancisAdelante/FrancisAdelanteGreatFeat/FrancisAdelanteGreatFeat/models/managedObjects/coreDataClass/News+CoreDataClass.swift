//
//  News+CoreDataClass.swift
//  FrancisAdelanteGreatFeat
//
//  Created by Francis Adelante on 4/6/18.
//  Copyright © 2018 Developer. All rights reserved.
//
//

import Foundation
import CoreData

public class News: NSManagedObject {
    @discardableResult static func newsObjectWithData(newsData: [String: AnyObject]) -> News? {
        
        let title = newsData["title"] as? String
        
        let keyValuePair = KeyValuePair(key: "title", value: title as AnyObject)
        var newsObject = DataManager.shared.fetchObject(entityName: News.classNameAsString(), keyValuePair: keyValuePair) as? News
        if newsObject == nil {
            newsObject = News.createObjectInContext(context: DataManager.shared.managedObjectContext) as? News
            newsObject?.title = title
        }
        
        let body = newsData["description"] as? String
        let newsUrl = newsData["url"] as? String
        let imageUrl = newsData["urlToImage"] as? String
        
        newsObject?.body = body
        newsObject?.url = newsUrl
        newsObject?.imageUrl = imageUrl
        
        
        if let timeStamp = newsData["publishedAt"] as? String {
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat =
            
            "yyyy'-'MM'-'dd'T'HH':'mm':'ss'+'SS':'SS"
            
           
            if  let timeStampToDate = dateFormatterGet.date(from: timeStamp) as NSDate? {
                newsObject?.timeStamp = timeStampToDate
            }
            
            
        }
        return newsObject
    }
}
