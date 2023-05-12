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
    public let releaseYear: String
    public let imageURL: String

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
        self.releaseYear = MoviesListEntity.getReleaseYear(from: releaseDate ?? "")
        self.imageURL = "\(Constants.baseImageURL.rawValue)\(posterPath ?? "")"
    }

    private static func getReleaseYear(from strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: strDate) else { return "" }

        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        return yearString
    }

    enum Constants: String {
        case baseImageURL = "https://image.tmdb.org/t/p/w500"
    }
}


