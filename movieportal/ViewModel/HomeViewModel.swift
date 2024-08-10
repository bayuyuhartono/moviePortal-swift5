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
    
    var popularMovies: [MovieModel] = []
    var nowPlayingMovies: [MovieModel] = []
    var topRatedMovies: [MovieModel] = []
    
    init() {
        Task {
            await getPopularData()
            await getNowPlaying()
            await getTopRated()
        }
    }
    
    private func getPopularData() async {
        status = .fetching
        
        do {
            popularMovies = try await fetcher.fetchMovie(path: CategoryItems.popular.path)
            status = .successPopular
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }
    
    private func getNowPlaying() async {
        status = .fetching
        
        do {
            nowPlayingMovies = try await fetcher.fetchMovie(path: CategoryItems.nowPlaying.path)
            status = .successNowPlaying
        } catch {
            print(error)
            status = .failed(error: error)
        }
    }
    
    private func getTopRated() async {
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
