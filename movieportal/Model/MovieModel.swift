// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct MovieModel: Decodable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath
        case genreIds
        case id
        case originalLanguage
        case originalTitle
        case overview, popularity
        case posterPath
        case releaseDate
        case title, video
        case voteAverage
        case voteCount
    }
}

struct MovieResponse: Decodable {
    let page: Int16
    let results: [MovieModel]
}
