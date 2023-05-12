import Foundation

public struct DiscoverMoviesEntity : Codable {
	public let page : Int?
	public let moviesList : [MoviesListEntity]?
	public let totalPages : Int?
	public let totalResults : Int?

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
