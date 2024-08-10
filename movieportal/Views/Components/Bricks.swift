//
//  Bricks.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 10/08/24.
//

import SwiftUI

struct Bricks: View {
    let title: String
    let data: [MovieModel]
    let imageBaseURL = ProcessInfo.processInfo.environment["IMAGE_BASE_URL"] ?? "defaultURL"
    
    var body: some View {
        VStack {
            GroupLabel(text: title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<data.count, id: \.self) { index in
                        let element = data[index]
                        ZStack(alignment: .topLeading) {
                            AsyncImage(url: URL(string: "\(imageBaseURL)\(element.posterPath)")) { image in
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
                                Text(String(round(element.voteAverage * 100) / 100.0))
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
                        .frame(height: 200)
                        .background(.ultraThinMaterial)
                        .shadow(radius: 20)
                        .cornerRadius(8.0)
                        .padding(.horizontal, 4)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    Bricks(title: "Now Playing", data: HomeViewModel().popularMovies)
        .preferredColorScheme(.dark)
}
