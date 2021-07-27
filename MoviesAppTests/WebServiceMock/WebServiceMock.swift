//
//  WebServiceMock.swift
//  MoviesAppTests
//
//  Created by AhmedFitoh on 7/27/21.
//

import Foundation
@testable import MoviesApp

class WebServiceMock: WebService{
    
    override func request(_ api: EndPoints,
                          completion: @escaping (Data?) -> Void,
                          failure: @escaping (Error?) -> Void) {
        let bundle = Bundle(for: WebServiceMock.self)
        if api.url == EndPoints.fetchTrendingMovies(page: 1).url{
            if let path = bundle.path(forResource: "movies_stub", ofType: "json") {
                if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe){
                    completion(data)
                } else {
                    failure(CustomError.generalError)
                }
            }
            
        }
    }
}
