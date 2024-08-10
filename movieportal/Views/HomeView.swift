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
            ScrollView {
                Carousel(title: "Popular", data: vm.popularMovies)
                Bricks(title: "Now Playing", data: vm.popularMovies)
                Bricks(title: "Upcoming", data: vm.popularMovies)
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass.circle")
                            .font(.title)
                            .foregroundColor(.uiSmoke)
                    }
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
