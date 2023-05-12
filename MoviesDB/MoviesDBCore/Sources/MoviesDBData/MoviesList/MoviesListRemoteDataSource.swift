import Foundation
import MoviesDBDomain

public protocol MoviesListRemoteDataSourceInterface {

    init (urlString: String)

    func getMoviesList(handler: @escaping (Result<DiscoverMoviesModel, MoviesDBErros>) -> Void)
}

public class MoviesListRemoteDataSource: MoviesListRemoteDataSourceInterface {
    let urlString: String

    required public init(urlString: String ) {
        self.urlString = urlString
    }

    public func getMoviesList(handler: @escaping (Result<DiscoverMoviesModel, MoviesDBErros>) -> Void) {
        guard let url = URL(string: "\(urlString)") else {
            handler(.failure(MoviesDBErros.NotFound))
            return
        }

        let task  = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200...299:
                    break
                case 400:
                    handler(.failure(MoviesDBErros.BadRequest))
                case 404:
                    handler(.failure(MoviesDBErros.NotFound))
                case 500:
                    handler(.failure(MoviesDBErros.InternalServerError))
                default:
                    handler(.failure(MoviesDBErros.InternalServerError))
                }
            }

            guard let data = data else {
                if let error = error {
                    handler(.failure(MoviesDBErros.GenericError(message: error.localizedDescription)))
                }
                return
            }

            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(DiscoverMoviesModel.self, from: data)
                handler(.success(result))
            } catch {
                handler(.failure(MoviesDBErros.WrongData))
            }
        }
        task.resume()
    }
}

