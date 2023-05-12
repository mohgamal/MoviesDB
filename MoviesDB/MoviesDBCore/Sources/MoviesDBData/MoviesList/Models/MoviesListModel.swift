//
//  File.swift
//  
//
//  Created by Mohammed Abdelaty on 12/05/2023.
//

import Foundation
import MoviesDBDomain

public struct MoviesListModel : Codable {
    public let adult : Bool?
    public let backdrop_path : String?
    public let genre_ids : [Int]?
    public let id : Int?
    public let original_language : String?
    public let original_title : String?
    public let overview : String?
    public let popularity : Double?
    public let poster_path : String?
    public let release_date : String?
    public let title : String?
    public let video : Bool?
    public let vote_average : Double?
    public let vote_count : Int?

    public func dotMoviesListModel() -> MoviesListEntity {
        return MoviesListEntity(adult: self.adult,
                                backdropPath: self.backdrop_path,
                                genreIds: self.genre_ids,
                                id: self.id,
                                originalLanguage: self.original_language,
                                originalTitle: self.original_title,
                                overview: self.overview,
                                posterPath: self.poster_path,
                                releaseDate: self.release_date,
                                title: self.title,
                                video: self.video,
                                voteAverage: self.vote_average,
                                voteCount: self.vote_count)
    }
}
