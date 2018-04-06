//
//  News+CoreDataProperties.swift
//  FrancisAdelanteGreatFeat
//
//  Created by Francis Adelante on 4/6/18.
//  Copyright © 2018 Developer. All rights reserved.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var timeStamp: NSDate?
    @NSManaged public var url: String?
    @NSManaged public var imageUrl: String?

}
