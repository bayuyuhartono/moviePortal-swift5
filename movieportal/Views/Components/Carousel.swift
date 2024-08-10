//
//  Carousel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 06/08/24.
//

import SwiftUI

struct Carousel: View {
    @State private var selectedImageIndex: Int = 0

    let title: String
    let data: [MovieModel]
    let imageBaseURL = ProcessInfo.processInfo.environment["IMAGE_BASE_URL"] ?? "defaultURL"
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            GroupLabel(text: title)
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<data.count, id: \.self) { index in
                    let element = data[index]
                    ZStack(alignment: .bottomLeading) {
                        AsyncImage(url: URL(string: "\(imageBaseURL)\(element.backdropPath)")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading) {
                            HStack(alignment: .bottom) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.uiYellow)
                                Text(String(round(element.voteAverage * 100) / 100.0))
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                            }
                            .shadow(radius: 9)

                            Text(element.originalTitle)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.leading, 32)
                        .padding(.bottom, 16)
                    }
                    .scaledToFill()
                    .frame(width: 360)
                    .background(.ultraThinMaterial)
                    .shadow(radius: 20)
                    .cornerRadius(8.0)
                }
            }
            .frame(height: 220)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            HStack {
                ForEach(0..<data.count, id: \.self) { index in
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
            withAnimation(.default) {
                selectedImageIndex = (selectedImageIndex + 1) % data.count
            }
        }
    }
}

#Preview {
    Carousel(title: "Popular", data: HomeViewModel().popularMovies)
        .preferredColorScheme(.dark)
}
