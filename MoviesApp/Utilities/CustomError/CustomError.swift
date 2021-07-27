//
//  CustomError.swift
//  MoviesApp
//
//  Created by AhmedFitoh on 7/27/21.
//

import Foundation

class CustomError: Error, LocalizedError {
    var errorCode: Int!
    var localizedDescription: String?
    
    init(code: Int, description: String?){
        self.errorCode = code
        localizedDescription = description
    }
}

// Add general error
extension CustomError {
    static var generalError: CustomError {
        //TODO :- check error code
        return CustomError(code: 9999, description: "An error occurred\nPlease try again later.")
    }
}
