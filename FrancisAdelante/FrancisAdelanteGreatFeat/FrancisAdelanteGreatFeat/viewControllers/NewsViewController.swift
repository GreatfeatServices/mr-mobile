//
//  NewsViewController.swift
//  FrancisAdelanteGreatFeat
//
//  Created by Francis Adelante on 4/5/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var timeStamp: UILabel!
    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var newsBody: UILabel!
    
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard news != nil else {
            return
        }
        newsTitle.text = news!.title
        newsBody.text = news!.body
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM dd,yyyy"
        
        if let date = news!.timeStamp as Date? {
            timeStamp.text = dateFormatterPrint.string(from: date)
        }
        
        newsImage.load(url: URL(string: news!.imageUrl!)!, placeholder: nil)
    }

}



