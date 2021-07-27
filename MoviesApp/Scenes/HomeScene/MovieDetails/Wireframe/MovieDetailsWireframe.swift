//
//  MovieDetailsWireframe.swift
//
//  Created by AhmedFitoh on 7/27/21.
//  
//

import UIKit

class MovieDetailsWireframe {
    
    // MARK: - Instance Variables
    weak var viewController: UIViewController!
    // Uncomment to utilize a navigation contoller from storyboard
    // weak var navigationController: UINavigationController?
    
    // MARK:- Life cycle
    init(movie: MovieModel,
         delegate: MovieDetailsDelegate? = nil) {
        let storyboard = UIStoryboard(name: MovieDetailsConstants.storyboardIdentifier, bundle: Bundle(for: MovieDetailsWireframe.self))
        
        // Uncomment to utilize a navigation contoller from storyboard
        /*
        navigationController = storyboard.instantiateViewController(withIdentifier: MovieDetailsConstants.navigationControllerIdentifier) as! UINavigationController
        let view = navigationController?.viewControllers[0] as! MovieDetailsView
        */
        
        // Remove if used navigation controller from storyboard
        let view = (storyboard.instantiateViewController(withIdentifier: MovieDetailsConstants.viewControllerIdentifier) as? MovieDetailsView)!
        
        viewController = view
        
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter(movie: movie, wireframe: self, view: view, interactor: interactor, delegate: delegate)
        
        view.presenter = presenter
        interactor.presenter = presenter
    }
}

// MARK: - Presenter to Wireframe Protocol
extension MovieDetailsWireframe: MovieDetailsPresenterToWireframeProtocol {
    
    
}
