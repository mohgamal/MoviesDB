import Foundation

public protocol MoviesListDomainRepoInterface {
    func getMoviesList(handler: @escaping (Result<DiscoverMoviesEntity, MoviesDBErros>)  -> (Void))
}
