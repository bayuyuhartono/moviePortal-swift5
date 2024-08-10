//
//  Carousel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 06/08/24.
//

import SwiftUI

struct Carousel: View {
    @State private var selectedImageIndex: Int = 0

    let carouselData: [MovieModel]
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<carouselData.count, id: \.self) { index in
                    let element = carouselData[index]
                    MovieWideCard(cardData: element)
                }
            }
            .frame(height: 220)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            HStack {
                ForEach(0..<carouselData.count, id: \.self) { index in
                    Capsule()
                        .fill(Color.white.opacity(selectedImageIndex == index ? 1 : 0.33))
                        .frame(width: 10, height: 10)
                        .onTapGesture {
                            selectedImageIndex = index
                        }
                }
            }
            .padding(.top, 8)
        }
        .padding(.vertical, 8)
        .onReceive(timer) { _ in
            if carouselData.count > 0 {
                withAnimation(.default) {
                    selectedImageIndex = (selectedImageIndex + 1) % carouselData.count
                }
            }
        }
    }
}

#Preview {
    Carousel(carouselData: HomeViewModel().popularMovies)
        .preferredColorScheme(.dark)
}
