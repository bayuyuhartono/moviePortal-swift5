//
//  Constants.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 06/08/24.
//

import Foundation

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case bookmark
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .bookmark:
            return "Bookmark"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "movieclapper"
        case .bookmark:
            return "bookmark"
        case .profile:
            return "person.circle"
        }
    }
}

enum CategoryItems: String, CaseIterable{
    case popular
    case nowPlaying
    case upcoming
    case topRated
    
    var title: String {
        switch self {
        case .popular:
            return "Popular"
        case .nowPlaying:
            return "Now Playing"
        case .upcoming:
            return "Upcoming"
        case .topRated:
            return "Top Rated"
        }
    }
    
    var path: String {
        switch self {
        case .popular:
            return "popular"
        case .nowPlaying:
            return "now_playing"
        case .upcoming:
            return "upcoming"
        case .topRated:
            return "top_rated"
        }
    }
}

enum Components: String, CaseIterable {
    case carousel
    case bricks
}

enum FetchStatus {
    case notStarted
    case fetching
    case successPopular
    case successNowPlaying
    case successTopRated
    case failed(error: Error)
}
