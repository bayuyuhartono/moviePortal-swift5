//
//  MovieCard.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 10/08/24.
//

import SwiftUI

struct MovieCard: View {
    let cardData: MovieModel
    let imageBaseURL = ProcessInfo.processInfo.environment["IMAGE_BASE_URL"] ?? ""
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: URL(string: "\(imageBaseURL)\(cardData.posterPath ?? "")")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            HStack() {
                Image(systemName: "star.fill")
                    .foregroundColor(.uiYellow)
                    .font(.caption2)
                Text(String(round(cardData.voteAverage * 100) / 100.0))
                    .foregroundStyle(.uiSmoke)
                    .font(.caption2)
                    .fontWeight(.bold)
            }
            .padding(2)
            .background(Color.uiCharcoal.opacity(0.7))
            .cornerRadius(5)
            .padding([.leading, .top], 4)
        }
        .scaledToFill()
        .frame(width: 160, height: 240)
        .background(.ultraThinMaterial)
        .shadow(radius: 20)
        .cornerRadius(8.0)
        .padding(.horizontal, 4)
    }
}

#Preview {
    MovieCard(cardData: HomeViewModel().sampleMovies[0])
}
