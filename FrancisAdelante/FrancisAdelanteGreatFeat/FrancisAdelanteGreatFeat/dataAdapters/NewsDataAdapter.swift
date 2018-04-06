//
//  NewsDataAdapter.swift
//  FrancisAdelanteGreatFeat
//
//  Created by Francis Adelante on 4/6/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit
import CoreData
protocol DataAdapter {
    
    func performFetch() -> Int
    var predicate: NSPredicate? { get set }
    var sortDescriptors: [NSSortDescriptor]? { get set }
    
}

class NewsDataAdapter: NSObject {
    var cachedCount = 0
    
    func performFetch() -> Int {
        do {
            try fetchedResultsController?.performFetch()
            guard let count = fetchedResultsController?.fetchedObjects?.count else {
                cachedCount = 0
                return 0
            }
            cachedCount = count
            return count
        } catch {
            
        }
        return 0
    }
    
    lazy var fetchRequest: NSFetchRequest<NSFetchRequestResult>? = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = News
            .entityDescriptionWithContext(context: DataManager.shared.managedObjectContext)
        fetchRequest.sortDescriptors = sortDescriptors ?? [NSSortDescriptor(key: "title", ascending: true)]
        fetchRequest.predicate = self.predicate
        return fetchRequest
    }()
    
    lazy var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>? = {
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: self.fetchRequest!,
                                                                  managedObjectContext: DataManager.shared.managedObjectContext,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        fetchedResultsController.delegate = self
        return fetchedResultsController
    }()
    
    var predicate: NSPredicate? {
        didSet {
            fetchRequest?.predicate = predicate
        }
    }
    var sortDescriptors: [NSSortDescriptor]? {
        didSet {
            fetchRequest?.sortDescriptors = sortDescriptors
        }
    }
}

extension NewsDataAdapter: NSFetchedResultsControllerDelegate {
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("")
    }
    
}

extension NewsDataAdapter: NewsListViewDataSource {
    
    func newsListView(numberOfObjects newsListView: NewsListView) -> Int {
        return performFetch()
    }
    func newsListView(newsObject newstListView: NewsListView, objectAt indexPath: IndexPath) -> News? {
        return fetchedResultsController?.object(at: indexPath) as? News
    }
    
}
