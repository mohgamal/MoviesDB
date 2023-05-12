//
//  File.swift
//  
//
//  Created by Mohammed Abdelaty on 12/05/2023.
//

import Foundation

public protocol MoviesListDomainRepoInterface {
    func getMoviesList(handler: @escaping (Result<DiscoverMoviesEntity, MoviesDBErros>)  -> (Void))
}
