//
//  SearchView.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 11/08/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    let vm = SearchViewModel()
    
    let debouncer = Debouncer(delay: 0.5)
    
    func search(query: String) async {
        await vm.getPopularData(for: query)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(vm.searchMovies) { item in
                    MovieWideCard(cardData: item)
                        .padding(.vertical, 4)
                }
            }
            .padding(16)
            .background(Color.uiBlack)
        }
        .ignoresSafeArea()
        .searchable(text: $searchText)
        .preferredColorScheme(.dark)
        .task {
            await vm.getPopularData(for: "batman")
        }
        .onChange(of: searchText) { oldValue, newValue in
            debouncer.debounce {
                Task{
                    await search(query: newValue)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
