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
        VStack {
            Carousel(data: vm.movies)
            Spacer()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    HomeView()
}
