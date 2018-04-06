//
//  NewsView.swift
//  FrancisAdelanteGreatFeat
//
//  Created by Francis Adelante on 4/5/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

protocol NewsListViewDataSource: class {
    func newsListView(numberOfObjects newsListView: NewsListView) -> Int
    func newsListView(newsObject newstListView: NewsListView, objectAt indexPath: IndexPath) -> News?
}

protocol NewsViewControllerDelegate: class {
    func newsListView(didSelect article: News)
}

class NewsListView: UIView {
    weak var newsListViewDataSource: NewsListViewDataSource?
    weak var newsListViewDelegate: NewsViewControllerDelegate?
    
    var tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    init() {
        super.init(frame: CGRect.zero)
        
        tableView.dataSource = self
        tableView.delegate = self
    
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 88.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        
        addSubview(tableView)
        tableView.bindFrameToSuperviewBounds()
        
        self.layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

extension NewsListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard newsListViewDataSource != nil else {
            return 0
        }
        return newsListViewDataSource!.newsListView(numberOfObjects: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var newsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell
        
        if newsTableViewCell == nil {
            newsTableViewCell = NewsTableViewCell.fromNib() as? NewsTableViewCell
        }
        
        newsTableViewCell?.news = newsListViewDataSource?.newsListView(newsObject: self, objectAt: indexPath)
        
        return newsTableViewCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = newsListViewDataSource?.newsListView(newsObject: self, objectAt: indexPath)
        guard news != nil else {
            return
        }
        newsListViewDelegate?.newsListView(didSelect: news!)
    }
    
}
