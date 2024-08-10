//
//  HomeViewModel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 09/08/24.
//

import Foundation

@Observable
class HomeViewModel {
    private(set) var status: FetchStatus = .notStarted
    
    private let fetcher = FetchService()
    
    var sampleMovies: [MovieModel]
    var popularMovies: [MovieModel] = []
    var nowPlayingMovies: [MovieModel] = []
    var topRatedMovies: [MovieModel] = []
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let sampleData = try! Data(contentsOf: Bundle.main.url(forResource: "samplemovies", withExtension: "json")!)
        sampleMovies = try! decoder.decode([MovieModel].self, from: sampleData)
    }
    
    func getPopularData() async {
        status = .fetching
        
        do {
            popularMovies = try await fetcher.fetchMovie(path: CategoryItems.popular.path)
            status = .successPopular
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }
    
    func getNowPlaying() async {
        status = .fetching
        
        do {
            nowPlayingMovies = try await fetcher.fetchMovie(path: CategoryItems.nowPlaying.path)
            status = .successNowPlaying
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }
    
    func getTopRated() async {
        status = .fetching
        
        do {
            topRatedMovies = try await fetcher.fetchMovie(path: CategoryItems.topRated.path)
            status = .successTopRated
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }

}
