import SwiftUI
import SDWebImageSwiftUI
import MoviesDBDomain

public struct MoviesListView: View {
    var appDI: AppDIInterface
    @ObservedObject public var moviesListVM: MoviesListVM

    public init(appDI: AppDIInterface, moviesListVM: MoviesListVM) {
        self.appDI = appDI
        self.moviesListVM = moviesListVM
    }

    public var body: some View {
        NavigationView {
            ScrollView {
                if moviesListVM.error != nil {
                    AnimatedImage(name: "retry.gif", bundle: .module) // Animation control binding
                        .maxBufferSize(.max)
                        .padding()
                    Text(moviesListVM.error!.localizedDescription)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding()
                    Text("An alien is probably blocking your signal")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14, weight: .light, design: .default))
                        .padding()
                    Button(action: self.reloadData)  {
                        Text("Rery")
                            .fontWeight(.semibold)
                            .font(.headline)
                            .foregroundColor(.green)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .border(Color.green)
                            .cornerRadius(5)
                            .padding()
                    }
                } else {
                    if moviesListVM.loading {
                        VStack {
                            if #available(iOS 14.0, *) {
                                ForEach((0..<10)) { _ in
                                    MovieCell(movieEntity : nil).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).shimmering()
                                        .redacted(reason: .placeholder)
                                }

                            } else { }
                        }.accessibility(identifier: "MoviesList")
                            .navigationBarTitle("Movies List")
                    }
                    VStack {
                        ForEach(moviesListVM.moviesList, id: \.id) { item in
                            MovieCell(movieEntity : item).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        }
                    } .accessibility(identifier: "MoviesList")
                        .navigationBarTitle("Movies List")
                }
            }
        }
        .onAppear {
            self.moviesListVM.getMoviesList()
        }
        .accessibility(identifier: "MoviesListView")
    }

    func reloadData() {
        self.moviesListVM.error = nil
        self.moviesListVM.getMoviesList()
    }
}
