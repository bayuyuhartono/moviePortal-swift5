// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct MovieModel: Decodable, Identifiable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate, title: String
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
    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(Int.self, forKey: .id)
//        adult = try container.decode(Bool.self, forKey: .adult)
//        genreIds = try container.decode([Int].self, forKey: .genreIds)
//        originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
//        originalTitle = try container.decode(String.self, forKey: .originalTitle)
//        overview = try container.decode(String.self, forKey: .overview)
//        popularity = try container.decode(Double.self, forKey: .popularity)
//        releaseDate = try container.decode(String.self, forKey: .releaseDate)
//        title = try container.decode(String.self, forKey: .title)
//        video = try container.decode(Bool.self, forKey: .video)
//        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
//        voteCount = try container.decode(Int.self, forKey: .voteCount)
//    }
}

struct MovieResponse: Decodable {
    let page: Int16
    let results: [MovieModel]
}
