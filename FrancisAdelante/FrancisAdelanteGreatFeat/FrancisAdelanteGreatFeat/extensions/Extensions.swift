//
//  NSError+Extensions.swift
//  FrancisAdelanteGreatFeat
//
//  Created by Francis Adelante on 4/5/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit
import CoreData

extension NSError {
    
    class func makeError(appErrorDomain: Int) -> NSError {
        
        var userInfo = [String: String]()
        
        switch appErrorDomain {
        case AppError.ParseError.code:
            userInfo[NSLocalizedDescriptionKey] = AppError.ParseError.message
            return NSError(domain: AppError.domain, code: appErrorDomain, userInfo: userInfo)
        case AppError.DataManagerFetchFail.code:
            userInfo[NSLocalizedDescriptionKey] = AppError.DataManagerFetchFail.message
            return NSError(domain: AppError.domain, code: appErrorDomain, userInfo: userInfo)
        default:
            userInfo[NSLocalizedDescriptionKey] = AppError.UnknownError.message
            return NSError(domain: AppError.domain, code: appErrorDomain, userInfo: userInfo)
        }
    
    }
    
}

extension NSObject {
    
    static func classNameAsString() -> String {
        return String(describing: self)
    }
    
}

extension NSManagedObject {
    
    static func createObjectInContext(context: NSManagedObjectContext) -> NSManagedObject! {
        return NSEntityDescription.insertNewObject(forEntityName: String(describing: self), into: context) as NSManagedObject
    }
    
    static func entityDescriptionWithContext(context: NSManagedObjectContext) -> NSEntityDescription! {
        return NSEntityDescription.entity(forEntityName: String(describing: self), in: context)!
    }
    
}

extension UIView {
   
    class func fromNib() -> UIView? {
        guard let selfView = Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)![0] as? UIView else {
            return nil
        }
        return selfView
    }
    
    func bindFrameToSuperviewBounds() {
            guard let superview = self.superview else {
                print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
                return
            }
            
            self.translatesAutoresizingMaskIntoConstraints = false
            superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
            superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
    
}
extension UIImageView {
    
    func load(url: URL, placeholder: UIImage?, cache: URLCache? = nil) {
        let cache = cache ?? URLCache.shared
        let request = URLRequest(url: url)
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            self.image = image
        } else {
            self.image = placeholder
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                    
                }
            }).resume()
        }
    }
}
