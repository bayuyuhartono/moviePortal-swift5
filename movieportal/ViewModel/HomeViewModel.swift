//
//  HomeViewModel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 09/08/24.
//

import Foundation

@Observable
class HomeViewModel {
    var movies: [MovieModel]
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let moviesData = try! Data(contentsOf: Bundle.main.url(forResource: "samplemovies", withExtension: "json")!)
        movies = try! decoder.decode([MovieModel].self, from: moviesData)
    }
}
