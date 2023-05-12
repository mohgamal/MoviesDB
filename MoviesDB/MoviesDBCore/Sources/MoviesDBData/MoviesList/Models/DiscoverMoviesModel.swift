//
//  File.swift
//  
//
//  Created by Mohammed Abdelaty on 12/05/2023.
//

import Foundation
import MoviesDBDomain

public struct DiscoverMoviesModel : Codable {
    public let page : Int?
    public let results : [MoviesListModel]?
    public let total_pages : Int?
    public let total_results : Int?

    /// The data object transfer for the result from the Data layer to domain layer
    func dotMoviesListModel() -> DiscoverMoviesEntity {
        return DiscoverMoviesEntity(page: self.page,
                                    moviesList: self.getMoviesList(),
                                    totalPages: self.total_pages,
                                    totalResults: self.total_results)
    }

    func getMoviesList() -> [MoviesListEntity] {
        var movies: [MoviesListEntity] = []

        for movie in self.results ?? [] {
            movies.append(movie.dotMoviesListModel())
        }

        return movies
    }
}
