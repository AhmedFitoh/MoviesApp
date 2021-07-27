@testable import MoviesApp

class MoviesListInteractorToPresenterInterfaceMock {
    var functionsCalled = [String]()
    
    // MARK: - Input Variables
    var info: MoviesListModel?
    var error: Error?
    weak var interactor: MoviesListPresenterToITestProtocolMock?
    
    init(interactor: MoviesListPresenterToITestProtocolMock) {
        self.interactor = interactor
    }
}

extension MoviesListInteractorToPresenterInterfaceMock: MoviesListInteractorToPresenterProtocol {
   
    func fetchTrendingMoviesSuccess(model: MoviesListModel) {
        functionsCalled.append(#function)
        info = model
        interactor?.fetchExp?.fulfill()
    }
    
    func fetchTrendingMoviesError(error: Error?) {
        functionsCalled.append(#function)
        self.error = error
        interactor?.fetchExp?.fulfill()
    }
}
