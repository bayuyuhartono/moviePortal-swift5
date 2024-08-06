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
