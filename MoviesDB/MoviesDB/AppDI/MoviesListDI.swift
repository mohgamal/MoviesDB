import MoviesDBDomain
import MoviesDBData
import MoviesDBPresentation

class MoviesListDI: AppDIInterface {
    let appEnvironment: AppEnvironment

    init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }

    func moviesListDependencies() -> MoviesListVM {
        let moviesBaseURL = appEnvironment.baseURL

        let moviesRemoteDataSource = MoviesListRemoteDataSource(urlString: moviesBaseURL)

        let moviesDataRepo = MoviesListDataRepo(moviesListRemoteDataSource: moviesRemoteDataSource)

        let moviesInteracrtor = MoviesListInteractor(moviesListgDomainRepoInterface: moviesDataRepo)

        let moviesVM = MoviesListVM(moviesListInteractor: moviesInteracrtor)

        return moviesVM
    }
}
