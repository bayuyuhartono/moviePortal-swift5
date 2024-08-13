//
//  CardWide.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 12/08/24.
//

import SwiftUI

struct MovieDetailImage: View {
    let cardData: MovieDetailModel
    let imageBaseURL = ProcessInfo.processInfo.environment["IMAGE_BASE_URL"] ?? ""
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: "\(imageBaseURL)\(cardData.posterPath)")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                HStack {
                    HStack() {
                        Image(systemName: "star.fill")
                            .foregroundColor(.uiYellow)
                            .font(.headline)
                        Text("\(String(round(cardData.voteAverage * 100) / 100.0))")
                            .foregroundStyle(.uiSmoke)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.uiSmoke)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.uiCharcoal.opacity(0.5))
                    .cornerRadius(40)

                    
                    Badge(text: cardData.releaseDate.dateFormatter() ?? "")

                }
                            
                HStack {
                    ForEach(0..<cardData.genres.count, id: \.self) { index in
                        let element = cardData.genres[index]
                        Badge(text: element.name)
                    }
                }

            }
            .padding(16)
        }
        .scaledToFill()
        .frame(height: 600)
        .shadow(radius: 20)
        .cornerRadius(8.0)
    }
}

#Preview {
    MovieDetailImage(cardData: MovieDetailViewModel().sampleDetail)
}

extension String {
    func dateFormatter() -> String? {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = formatter.date(from: self) else {
            return nil
        }
        
        formatter.dateFormat = "yyyy"

        return formatter.string(from: date)
    }
}
