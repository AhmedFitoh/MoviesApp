//
//  MoviesListWireframe.swift
//
//  Created by AhmedFitoh on 7/27/21.
//  
//

import UIKit

class MoviesListWireframe {
    
    // MARK: - Instance Variables
    weak var viewController: UIViewController!
    // Uncomment to utilize a navigation contoller from storyboard
     weak var navigationController: UINavigationController?
    
    // MARK:- Life cycle
    init(delegate: MoviesListDelegate? = nil) {
        let storyboard = UIStoryboard(name: MoviesListConstants.storyboardIdentifier, bundle: Bundle(for: MoviesListWireframe.self))
        
        // Uncomment to utilize a navigation contoller from storyboard
        
        navigationController = storyboard.instantiateViewController(withIdentifier: MoviesListConstants.navigationControllerIdentifier) as? UINavigationController
        let view = navigationController?.viewControllers[0] as! MoviesListView
        
        
        // Remove if used navigation controller from storyboard
//        let view = (storyboard.instantiateViewController(withIdentifier: MoviesListConstants.viewControllerIdentifier) as? MoviesListView)!
        
        viewController = view
        
        let interactor = MoviesListInteractor()
        let presenter = MoviesListPresenter(wireframe: self, view: view, interactor: interactor, delegate: delegate)
        
        view.presenter = presenter
        interactor.presenter = presenter
    }
}

// MARK: - Presenter to Wireframe Protocol
extension MoviesListWireframe: MoviesListPresenterToWireframeProtocol {
    
    func openMovieDetails(movie: MovieModel){
        if let movieDetailsViewController = MovieDetailsWireframe(movie: movie).viewController {
            viewController?.navigationController?.pushViewController(movieDetailsViewController, animated: true)
        }
    }
    
}
