//
//  GroupLabel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 10/08/24.
//

import SwiftUI

struct CategoryGroupLabel: View {
    let categoryData: CategoryItems
    
    var body: some View {
        NavigationLink {
            MovieListsView(category: categoryData)
        } label: {
            HStack {
                Text(categoryData.title)
                    .font(.title2)
                    .foregroundStyle(.uiSmoke)
                Spacer()
                Text("See all")
                    .foregroundStyle(.uiYellow)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    CategoryGroupLabel(categoryData: CategoryItems.topRated)
        .preferredColorScheme(.dark)
}
