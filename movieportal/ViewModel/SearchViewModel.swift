//
//  SearchModel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 11/08/24.
//

import Foundation

@Observable
class SearchViewModel {
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var searchMovies: [MovieModel] = []
    
    func getPopularData(for keyword: String) async {
        status = .fetching
        
        do {
            searchMovies = try await fetcher.fetchSearchMovie(keyword: keyword)
            status = .successPopular
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }
}
