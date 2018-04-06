//
//  NewsListViewController.swift
//  FrancisAdelanteGreatFeat
//
//  Created by Francis Adelante on 4/5/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {

    private var newsListView = NewsListView()
    private var newsListViewDataAdapter = NewsDataAdapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        newsListView.newsListViewDataSource = newsListViewDataAdapter
        newsListView.newsListViewDelegate = self
        
        view.addSubview(newsListView)
        newsListView.bindFrameToSuperviewBounds()
        view.layoutIfNeeded()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        ApiManager.shared.news.fetchNews { (response) in
            DispatchQueue.main.async {
                self.newsListView.reloadData()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "push.NewsViewController" {
            if let vc = segue.destination as? NewsViewController {
                vc.news = sender as? News
            }
        }
    }
}

extension NewsListViewController: NewsViewControllerDelegate {
    
    func newsListView(didSelect article: News) {
        performSegue(withIdentifier: "push.NewsViewController", sender: article)
    }
}
