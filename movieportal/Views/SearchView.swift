//
//  SearchView.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 11/08/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    let searchVm = SearchViewModel()
    
    let debouncer = Debouncer(delay: 0.5)
    
    func search(query: String) async {
        await searchVm.getSearchData(for: query)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                if searchVm.searchMovies.count > 0 {
                    ForEach(searchVm.searchMovies) { item in
                        MovieWideCard(cardData: item)
                            .padding(.vertical, 4)
                    }
                } else {
                    Text("Please enter your search text")
                        .foregroundStyle(.uiSmoke)
                        .padding(.vertical, 32)
                }
            }
            .frame(width: 500)
            .background(Color.uiBlack)
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
