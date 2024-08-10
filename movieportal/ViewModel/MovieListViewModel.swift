//
//  MovieListViewModel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 10/08/24.
//

import Foundation

@Observable
class MovieListViewModel {
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var movieLists: [MovieModel] = []
    
    func getPopularData(for path: String) async {
        status = .fetching
        
        do {
            movieLists = try await fetcher.fetchMovie(path: path)
            status = .successPopular
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }
}
