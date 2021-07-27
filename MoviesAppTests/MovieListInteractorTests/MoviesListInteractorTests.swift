import Foundation
import XCTest

@testable import MoviesApp

protocol MoviesListPresenterToITestProtocolMock: AnyObject {
    var fetchExp: XCTestExpectation? {get}
}
class MoviesListInteractorTests: XCTestCase, MoviesListPresenterToITestProtocolMock {
    var interactor: MoviesListInteractor!
    
    // MARK: - Test Objects
    var presenterMock: MoviesListInteractorToPresenterInterfaceMock!
    var fetchExp: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        interactor = MoviesListInteractor(webService: WebServiceMock())
        presenterMock = MoviesListInteractorToPresenterInterfaceMock(interactor: self)
        interactor.presenter = presenterMock
    }
    
    // MARK: - Operational
    
    func testFetchData(){
        fetchExp = expectation(description: "Fetching items")
        interactor.fetchTrendingMovies(page: 1)
        waitForExpectations(timeout: 5)
        XCTAssertNil(presenterMock?.error, "Error has been occurred")
        XCTAssertNotNil(presenterMock?.info, "Failed to load data.")
        XCTAssertEqual(presenterMock?.info?.results.count, 20, "Invalid parsing")
    }
    
    func testBuildingURL(){
        fetchExp = expectation(description: "Fetching items")
        interactor.fetchTrendingMovies(page: 1)
        waitForExpectations(timeout: 5)
        let generatedUrl = ImageUrlBuilder.getUrl(stringUrl: presenterMock?.info?.results.first?.posterPath, size: .original)
        XCTAssertEqual(generatedUrl?.absoluteString,
                       "https://image.tmdb.org/t/p/original//qAZ0pzat24kLdO3o8ejmbLxyOac.jpg",
                       "Invalid url")
    }
    
}


