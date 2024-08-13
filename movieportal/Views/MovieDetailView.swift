//
//  MovieDetailView.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 12/08/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movieId: String
    let movieDetailVm = MovieDetailViewModel()
    let imageBaseURL = ProcessInfo.processInfo.environment["IMAGE_BASE_URL"] ?? ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if movieDetailVm.detailMovie != nil {
                    let movie = movieDetailVm.detailMovie
                    let similarMovies = movieDetailVm.similarMovies
                    MovieDetailImage(cardData: movie!)
                    
                    VStack(alignment: .leading) {
                        Text(movie!.title)
                            .font(.title)
                            .foregroundStyle(.uiYellow)
                        Spacer()
                        Text(movie!.overview)
                            .font(.subheadline)
                            .foregroundStyle(.uiSmoke)
                        
                        Spacer()
                        Spacer()
                        
                        Text("More like this")
                            .font(.title2)
                            .foregroundStyle(.uiYellow)
                    }
                    .padding(.vertical, 4)
                    .padding(.leading)
                    
                    Bricks(bricksData: similarMovies)
                }
            }
        }
        .background(Color.uiBlack)
        .ignoresSafeArea()
        .task {
            await movieDetailVm.getDetailData(for: movieId)
        }
    }
}

#Preview {
    MovieDetailView(movieId: "519182")
}
