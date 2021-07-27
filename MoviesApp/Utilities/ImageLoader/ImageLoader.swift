//
//  ImageLoader.swift
//  MoviesApp
//
//  Created by AhmedFitoh on 7/27/21.
//

import UIKit

extension UIImageView {
    /// Singleton cache variable
    var imageCache: NSCache<NSString, UIImage> {
        return ImageCacheManager.shared.imageCacher
    }

    /// Load image contained in reusable cells
    func loadImageUsingCache(withUrl url: URL?, cellIndexPathRow: Int, placeHolderImage: UIImage? = nil) {
        guard let url = url else {
            return
        }
        self.image = placeHolderImage
        self.tag = cellIndexPathRow
        // check cached image is already fetched
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = cachedImage
            return
        }
        // if not, download image from url
        URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                if self.tag != cellIndexPathRow {
                    return
                }
                if  let data = data,
                    let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    self.image = image
                } else {
                    print ("Invalid image @ \(url)")
                }
            }
        }).resume()
    }
    
    
    func loadImageUsingCache(withUrl url: URL?, placeHolderImage: UIImage? = nil) {
        guard let url = url else {
            return
        }
        self.image = placeHolderImage
        // check cached image is already fetched
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = cachedImage
            return
        }
        // if not, download image from url
        URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                if  let data = data,
                    let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    self.image = image
                } else {
                    print ("Invalid image @ \(url)")
                }
            }
        }).resume()
    }
    
}


