//
//  HeadLinesCell.swift
//  NewsApp
//
//  Created by AhmedFitoh on 7/27/21.
//

import UIKit

class MoviesListCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI(){
        posterImageView.layer.cornerRadius = 5
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }

    func setupCellWith(movie: MovieModel, indexPath: IndexPath){
        titleLabel.text = movie.movieName
        descLabel.text = movie.overview
        posterImageView.loadImageUsingCache(withUrl: ImageUrlBuilder.getUrl(stringUrl: movie.posterPath, size: .w92), cellIndexPathRow: indexPath.row)
    }

}
