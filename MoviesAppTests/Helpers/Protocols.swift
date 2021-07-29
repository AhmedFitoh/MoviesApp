//
//  Protocols.swift
//  MoviesAppTests
//
//  Created by AhmedFitoh on 7/29/21.
//

import XCTest

protocol PresenterToInteractorTestProtocolMock: AnyObject {
    var fetchExp: XCTestExpectation? {get}
}
