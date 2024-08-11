//
//  HomeView.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 06/08/24.
//

import SwiftUI

struct HomeView: View {
    let homeVm = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                CategoryGroupLabel(categoryData: CategoryItems.popular)
                Carousel(carouselData: homeVm.popularMovies)
                
                CategoryGroupLabel(categoryData: CategoryItems.nowPlaying)
                Bricks(bricksData: homeVm.nowPlayingMovies)
                
                CategoryGroupLabel(categoryData: CategoryItems.topRated)
                Bricks(bricksData: homeVm.topRatedMovies)
                
                Spacer(minLength: 40)

            }
            .padding(.top, 16)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("MOVIE PORTAL")
                        .font(.title2)
                        .foregroundStyle(.uiBlack)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundStyle(.uiSmoke)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.uiYellow)
                        .cornerRadius(8)
                }
            }
            .background(Color.uiBlack)
        }
        .preferredColorScheme(.dark)
        .task {
            await homeVm.getPopularData()
            await homeVm.getNowPlaying()
            await homeVm.getTopRated()
        }
    }
}

#Preview {
    HomeView()
}

