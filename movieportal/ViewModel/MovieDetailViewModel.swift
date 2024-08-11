//
//  MovieDetailViewModel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 11/08/24.
//

import Foundation

@Observable
class MovieDetailViewModel {
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var detailMovie: MovieDetailModel? = nil
    var similarMovies: [MovieModel] = []
    
    func getDetailData(for id: String) async {
        status = .fetching
        
        do {
            detailMovie = try await fetcher.fetchMovieDetail(id: id)
            similarMovies = try await fetcher.fetchSimilarMovies(id: id)
            status = .successDetail
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }
}
