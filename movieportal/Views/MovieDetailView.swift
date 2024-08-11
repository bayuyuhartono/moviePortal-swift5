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
    
    var body: some View {
        VStack {
            if movieDetailVm.detailMovie != nil {
                Text(movieDetailVm.detailMovie!.title)
                    .fontWeight(.bold)
            } else {
                ProgressView()
            }
            ForEach(movieDetailVm.similarMovies) { similar in
                Text(similar.title)
            }
        }
        .task {
            await movieDetailVm.getDetailData(for: movieId)
        }
    }
}

#Preview {
    MovieDetailView(movieId: "533535")
}
