import Foundation

public struct DiscoverMoviesEntity : Codable {
	let page : Int?
	let moviesList : [MoviesListEntity]?
	let totalPages : Int?
	let totalResults : Int?

    public init(page: Int? = nil,
                  moviesList: [MoviesListEntity]? = nil,
                  totalPages: Int? = nil,
                  totalResults: Int? = nil) {
        self.page = page
        self.moviesList = moviesList
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
