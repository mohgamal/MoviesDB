import Foundation

public protocol MoviesListDomainRepoInterface {
    func getMoviesList(page: Int, handler: @escaping (Result<DiscoverMoviesEntity, MoviesDBErros>)  -> (Void))
}
