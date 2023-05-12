import Foundation

public protocol MoviesListInteractorInterface {
    func getMoviesList(page: Int, handler: @escaping (Result<DiscoverMoviesEntity, MoviesDBErros>)  -> (Void))
}

public class MoviesListInteractor: MoviesListInteractorInterface {
    let moviesListDomainRepoInterface: MoviesListDomainRepoInterface

    public init(moviesListgDomainRepoInterface: MoviesListDomainRepoInterface) {
        self.moviesListDomainRepoInterface = moviesListgDomainRepoInterface
    }

    public func getMoviesList(page: Int = 1, handler: @escaping (Result<DiscoverMoviesEntity, MoviesDBErros>) -> (Void)) {
        moviesListDomainRepoInterface.getMoviesList(page: page) { moviesListDomainEntity in
            handler(moviesListDomainEntity)
        }
    }
}
