//
//  ImageLoader.swift
//  MoviesApp
//
//  Created by AhmedFitoh on 7/27/21.
//

import UIKit

extension UIImageView {
    
    
    /// Load image contained in reusable cells
    func loadImageUsingCache(withUrl url: URL?, cellIndexPathRow: Int, placeHolderImage: UIImage? = nil) {
        guard let url = url else {
            return
        }
        self.image = placeHolderImage
        self.tag = cellIndexPathRow
        
        // check cached image is already fetched
        if let imageUrl = ImageCacheManager.shared.isImageAvailable(forUrl: url){
            ImageCacheManager.shared.loadImage(withUrl: imageUrl, to: self)
            return
        }
        
        let urlSession = URLSession(configuration: .ephemeral)
        // if not, download image from url
        urlSession.dataTask(with: url, completionHandler: {[weak self] (data, _, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                if self?.tag != cellIndexPathRow {
                    return
                }
                if  let data = data,
                    let image = UIImage(data: data) {
                    ImageCacheManager.shared.save(image: data, withUrl: url)
                    self?.image = image
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
        let urlSession = URLSession(configuration: .ephemeral)
        self.image = placeHolderImage
        // check cached image is already fetched
        if let imageUrl = ImageCacheManager.shared.isImageAvailable(forUrl: url){
            ImageCacheManager.shared.loadImage(withUrl: imageUrl, to: self)
            return
        }
        // if not, download image from url
        urlSession.dataTask(with: url, completionHandler: {[weak self] (data, _, error) in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                if  let data = data,
                    let image = UIImage(data: data) {
                    ImageCacheManager.shared.save(image: data, withUrl: url)
                    self?.image = image
                } else {
                    print ("Invalid image @ \(url)")
                }
            }
        }).resume()
    }
    
}


