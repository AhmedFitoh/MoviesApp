//
//  MovieDetailsViewProtocols.swift
//
//  Created by AhmedFitoh on 7/27/21.
//  
//

// VIPER Protocol for communication from Presenter -> View
protocol MovieDetailsPresenterToViewProtocol: AnyObject, Alertable{
    func showPreloadedInfo()
    func showExternalInfo()
}
