//
//  HomeView.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 06/08/24.
//

import SwiftUI

struct HomeView: View {
    let vm = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                CategoryGroupLabel(categoryData: CategoryItems.popular)
                Carousel(carouselData: vm.popularMovies)
                
                CategoryGroupLabel(categoryData: CategoryItems.nowPlaying)
                Bricks(bricksData: vm.nowPlayingMovies)
                
                CategoryGroupLabel(categoryData: CategoryItems.topRated)
                Bricks(bricksData: vm.topRatedMovies)

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
    }
}

#Preview {
    HomeView()
}

