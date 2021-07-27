//
//  MoviesListWireframeProtocols.swift
//
//  Created by AhmedFitoh on 7/27/21.
//  
//

// VIPER Module Constants
struct MoviesListConstants {
    
    // Uncomment to utilize a navigation contoller from storyboard
     static let navigationControllerIdentifier = "MoviesListNavigationController"
    
    static let storyboardIdentifier = "MoviesList"
    static let viewControllerIdentifier = "MoviesListView"
}

// VIPER Protocol for communication from Presenter -> Wireframe
protocol MoviesListPresenterToWireframeProtocol: AnyObject {
    func openMovieDetails(movie: MovieModel)
}
