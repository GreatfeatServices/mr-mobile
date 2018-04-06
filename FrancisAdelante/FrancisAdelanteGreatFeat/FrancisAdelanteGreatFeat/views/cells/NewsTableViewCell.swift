//
//  NewsTableViewCell.swift
//  FrancisAdelanteGreatFeat
//
//  Created by Francis Adelante on 4/5/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var timeStamp: UILabel!
    
    var news: News? {
        didSet {
            
            guard news != nil else {
                return
            }
            title.text = news!.title
           
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MM dd,yyyy"
            
            if let date = news!.timeStamp as Date? {
                timeStamp.text = dateFormatterPrint.string(from: date)
            }
        }
    }
   
}
