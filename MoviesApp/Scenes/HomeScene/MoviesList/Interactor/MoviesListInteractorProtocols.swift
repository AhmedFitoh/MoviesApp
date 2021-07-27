//
//  MoviesListInteractorProtocols.swift
//
//  Created by AhmedFitoh on 7/27/21.
//  
//

// VIPER Protocol for communication from Presenter to Interactor
protocol MoviesListPresenterToInteractorProtocol: AnyObject {
    func fetchTrendingMovies(page: Int)
}
