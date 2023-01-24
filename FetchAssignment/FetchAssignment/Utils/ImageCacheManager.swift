//
//  ImageModelCacheManager.swift
//  FetchAssignment
//
//  Created by Sai Jannali on 1/19/23.
//

import Foundation
import UIKit

class ImageCacheManager {
    
    static let instance = ImageCacheManager()
    
    private init() { }
    
    var imageCache: NSCache<NSString , UIImage> = {
       var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 200 // 200mb
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        imageCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: String)  -> UIImage? {
        return imageCache.object(forKey: key as NSString)
    }
}

