import SwiftUI
import MoviesDBDomain

public class MoviesListVM: ObservableObject {
    @Published var moviesList: [MoviesListEntity] = []
    @Published var loading = true
    var error: Error?

    private var moviesListInteractor: MoviesListInteractor

    public init(moviesListInteractor: MoviesListInteractor) {
        self.moviesListInteractor = moviesListInteractor
    }

    func getMoviesList(page: Int) {
        self.loading = true
        moviesListInteractor.getMoviesList(page: page) { [weak self] (moviesResult) in
            DispatchQueue.main.async {
                self?.loading = false
                switch moviesResult {
                case .success(let moviesListEntity):
                    self?.moviesList.append(contentsOf: moviesListEntity.moviesList ?? [])
                    self?.objectWillChange.send()
                case .failure(let error):
                    self?.error = error
                    self?.objectWillChange.send()
                }
            }
        }
    }
}
