import Foundation
import MoviesDBDomain

public class MoviesListDataRepo: MoviesListDomainRepoInterface {

    let moviesListRemoteDataSource: MoviesListRemoteDataSourceInterface

    public init (moviesListRemoteDataSource: MoviesListRemoteDataSourceInterface) {
        self.moviesListRemoteDataSource = moviesListRemoteDataSource
    }

    public func getMoviesList(page: Int = 1, handler: @escaping (Result<DiscoverMoviesEntity, MoviesDBErros>) -> (Void)) {
        moviesListRemoteDataSource.getMoviesList(page: page){ discoverMoviesModel in
            switch discoverMoviesModel {
            case .success(let moviesResultModel):
                handler(.success(moviesResultModel.dotMoviesListModel()))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
