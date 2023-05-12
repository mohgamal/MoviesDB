import Foundation

public struct MoviesListEntity : Codable {
	public let adult : Bool?
	public let backdropPath : String?
	public let genreIds : [Int]?
	public let id : Int?
	public let originalLanguage : String?
	public let originalTitle : String?
	public let overview : String?
	public let popularity : Double?
	public let posterPath : String?
	public let releaseDate : String?
	public let title : String?
	public let video : Bool?
	public let voteAverage : Double?
	public let voteCount : Int?

    public init(adult: Bool? = nil,
                backdropPath: String? = nil,
                genreIds: [Int]? = nil,
                id: Int? = nil,
                originalLanguage: String? = nil,
                originalTitle: String? = nil,
                overview: String? = nil,
                popularity: Double? = nil,
                posterPath: String? = nil,
                releaseDate: String? = nil,
                title: String? = nil,
                video: Bool? = nil,
                voteAverage: Double? = nil,
                voteCount: Int? = nil) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }

}
