import MoviesDBPresentation

class AppDI: AppDIInterface {
    static let shared = AppDI(appEnvironment: AppEnvironment())

    let appEnvironment: AppEnvironment

    init (appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }

    func moviesListDependencies() -> MoviesListVM {
        let moviesListDI = MoviesListDI(appEnvironment: appEnvironment)
        let moviesListVM = moviesListDI.moviesListDependencies()

        return moviesListVM
    }
}
