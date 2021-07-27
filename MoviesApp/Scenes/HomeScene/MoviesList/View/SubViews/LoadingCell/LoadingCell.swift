//
//  LoadingCell.swift
//  MoviesApp
//
//  Created by AhmedFitoh on 7/27/21.
//

import UIKit

class LoadingCell: UITableViewCell {

 
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        activityIndicator.startAnimating()
    }
    
}
