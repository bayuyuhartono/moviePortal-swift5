//
//  Bricks.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 10/08/24.
//

import SwiftUI

struct Bricks: View {
    let bricksData: [MovieModel]
        
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(bricksData) { item in
                        MovieCard(cardData: item)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    Bricks(bricksData: HomeViewModel().popularMovies)
        .preferredColorScheme(.dark)
}
