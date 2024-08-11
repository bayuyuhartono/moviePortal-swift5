//
//  FetchService.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 09/08/24.
//

import Foundation

struct FetchService {
    enum FetchError: Error {
        case badURL, badResponse, badData
    }
    
    private let baseURL = URL(string: ProcessInfo.processInfo.environment["BASE_URL"] ?? "")!
    private let token = ProcessInfo.processInfo.environment["TOKEN"] ?? ""
    
    func fetchMovie(path: String) async throws -> [MovieModel] {
        let movieURL = baseURL.appending(path: "/movie/\(path)")
        var request = URLRequest(url: movieURL)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let movies = try decoder.decode(MovieResponse.self, from: data)
        
        return movies.results
    }
    
    func fetchSearchMovie(keyword: String) async throws -> [MovieModel] {
        let searchMovieURL = baseURL.appending(path: "/search/movie")
            .appending(queryItems: [URLQueryItem(name: "query", value: keyword)])
        var request = URLRequest(url: searchMovieURL)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let movies = try decoder.decode(MovieResponse.self, from: data)
        
        return movies.results
    }
    
    func fetchMovieDetail(id: String) async throws -> MovieDetailModel {
        let movieDetailURL = baseURL.appending(path: "/movie/\(id)")
        var request = URLRequest(url: movieDetailURL)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let movies = try decoder.decode(MovieDetailModel.self, from: data)
        
        return movies
    }
    
    func fetchSimilarMovies(id: String) async throws -> [MovieModel] {
        let movieURL = baseURL.appending(path: "/movie/\(id)/similar")
        var request = URLRequest(url: movieURL)
        request.addValue("application/json", forHTTPHeaderField: "accept")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let movies = try decoder.decode(MovieResponse.self, from: data)
        
        return movies.results
    }
    
}
