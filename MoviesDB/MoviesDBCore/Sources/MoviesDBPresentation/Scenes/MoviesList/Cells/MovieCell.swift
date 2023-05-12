import Shimmer
import SwiftUI
import MoviesDBDomain

struct MovieCell: View {
    @ObservedObject private var imageLoader: DataLoader
    let placeholderText = "                                      "
    let movieEntity: MoviesListEntity?

    init (movieEntity: MoviesListEntity?) {
        self.movieEntity = movieEntity
        imageLoader = DataLoader(resourseURL: URL(string: movieEntity?.posterPath ?? ""))
    }

    var body: some View {
        HStack {
            if let uiImage = UIImage(data: self.imageLoader.data) {
                AnyView(Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                )
            } else {
                AnyView(Image(systemName: "photo")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                    .onAppear(perform: { self.imageLoader.loadImage() }))
            }
            VStack {
                Text(movieEntity?.title ?? placeholderText)
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                Text("\(movieEntity?.releaseDate ?? placeholderText)")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                Text("\(movieEntity?.overview ?? placeholderText)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(4)
                    .padding(5)

            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2))
    }
}

