//
//  MovieLists.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 10/08/24.
//

import SwiftUI

struct MovieListsView: View {
    let category: CategoryItems
    let vm = MovieListViewModel()
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                    ForEach(vm.movieLists) { item in
                        MovieCard(cardData: item)
                    }
                }
            }
            .padding(16)
            .background(Color.uiBlack)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(category.title)
                    .font(.title2)
                    .foregroundColor(.uiYellow)
            }
        }
        .font(.title)
        .foregroundColor(.uiSmoke)
        .task {
            await vm.getPopularData(for: category.path)
        }
    }
}

#Preview {
    MovieListsView(category: CategoryItems.topRated)
        .preferredColorScheme(.dark)
}
