import Foundation

public protocol MoviesListInteractorInterface {
    func getMoviesList(handler: @escaping (Result<DiscoverMoviesEntity, MoviesDBErros>)  -> (Void))
}

public class MoviesListInteractor: MoviesListInteractorInterface {
    let moviesListDomainRepoInterface: MoviesListDomainRepoInterface

    public init(moviesListgDomainRepoInterface: MoviesListDomainRepoInterface) {
        self.moviesListDomainRepoInterface = moviesListgDomainRepoInterface
    }

    public func getMoviesList(handler: @escaping (Result<DiscoverMoviesEntity, MoviesDBErros>) -> (Void)) {
        moviesListDomainRepoInterface.getMoviesList() { moviesListDomainEntity in
            handler(moviesListDomainEntity)
        }
    }
}
