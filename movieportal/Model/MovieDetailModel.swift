//
//  MovieDetailModel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 11/08/24.
//

import Foundation

struct MovieDetailModel: Decodable {
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: BelongsToCollection
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let originCountry: [String]
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let releaseDate: String
    let revenue, runtime: Int
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath
        case belongsToCollection
        case budget, genres, homepage, id
        case originCountry
        case originalLanguage
        case originalTitle
        case overview, popularity
        case posterPath
        case productionCompanies
        case releaseDate
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage
        case voteCount
    }
}

struct BelongsToCollection: Decodable {
    let id: Int
    let name, posterPath, backdropPath: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath
        case backdropPath
    }
}

struct Genre: Decodable {
    let id: Int
    let name: String
}

struct ProductionCompany: Decodable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath
        case name
        case originCountry
    }
}
