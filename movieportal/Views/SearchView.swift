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
        await vm.getSearchData(for: query)
    }
    
    var body: some View {
        NavigationStack {
            if vm.searchMovies.count > 0 {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(vm.searchMovies) { item in
                        MovieWideCard(cardData: item)
                            .padding(.vertical, 4)
                    }
                }
                .frame(width: 500)
                .background(Color.uiBlack)
            } else {
                Text("Please enter your search text")
            }
        }
        .ignoresSafeArea()
        .searchable(text: $searchText)
        .preferredColorScheme(.dark)
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
