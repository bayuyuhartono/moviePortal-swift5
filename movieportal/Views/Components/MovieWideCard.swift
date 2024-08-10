//
//  MovieWideCard.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 10/08/24.
//

import SwiftUI

struct MovieWideCard: View {
    let cardData: MovieModel
    let imageBaseURL = ProcessInfo.processInfo.environment["IMAGE_BASE_URL"] ?? "defaultURL"
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: "\(imageBaseURL)\(cardData.backdropPath)")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.uiYellow)
                    Text(String(round(cardData.voteAverage * 100) / 100.0))
                        .font(.subheadline)
                        .foregroundStyle(.white)
                }
                .shadow(radius: 9)

                Text(cardData.originalTitle)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding(.leading, 32)
            .padding(.bottom, 16)
        }
        .scaledToFill()
        .frame(width: 360, height: 220)
        .background(.ultraThinMaterial)
        .shadow(radius: 20)
        .cornerRadius(8.0)
    }
}

#Preview {
    MovieWideCard(cardData: HomeViewModel().sampleMovies[0])
}
