//
//  MoviesDBApp.swift
//  MoviesDB
//
//  Created by Mohammed Abdelaty on 09/05/2023.
//

import SwiftUI
import MoviesDBPresentation

@main
struct MoviesDBApp: App {
    var body: some Scene {
        WindowGroup {
            let moviesListViewView = MoviesListView(appDI: AppDI.shared,
                                                    moviesListVM: AppDI.shared.moviesListDependencies())

            moviesListViewView
        }
    }
}
