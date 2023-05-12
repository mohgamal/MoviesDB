import SwiftUI
import MoviesDBDomain

public struct MoviesListView: View {
    var appDI: AppDIInterface
    @ObservedObject public var moviesListVM: MoviesListVM
    @State private var page = 1

    public init(appDI: AppDIInterface, moviesListVM: MoviesListVM) {
        self.appDI = appDI
        self.moviesListVM = moviesListVM
    }

    public var body: some View {
        NavigationView {
            ScrollView {
                if let error = moviesListVM.error {
                    ErrorView(reloadData: self.reloadData, error: error.localizedDescription)
                } else {
                    if moviesListVM.loading {
                        VStack {
                            ForEach((0..<10)) { _ in
                                MovieCell(movieEntity : nil).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).shimmering()
                                    .redacted(reason: .placeholder)
                            }
                        }.accessibility(identifier: "MoviesList")
                            .navigationBarTitle("Movies List")
                    }
                    VStack {
                        ForEach(moviesListVM.moviesList, id: \.id) { item in
                            MovieCell(movieEntity : item).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        }
                    }
                    .accessibility(identifier: "MoviesList")
                    .navigationBarTitle("Movies List")
                }
            }
        }
        .onAppear {
            self.moviesListVM.getMoviesList(page: page)
        }
        .accessibility(identifier: "MoviesListView")
    }

    func reloadData() {
        self.moviesListVM.error = nil
        self.moviesListVM.getMoviesList(page: page)
    }
}
