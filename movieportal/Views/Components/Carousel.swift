//
//  Carousel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 06/08/24.
//

import SwiftUI

struct Carousel: View {
    @State private var selectedImageIndex: Int = 0

    var data: [MovieModel]
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    let imageBaseURL = ProcessInfo.processInfo.environment["IMAGE_BASE_URL"] ?? "defaultURL"
    
    var body: some View {
        ZStack {
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
                        .padding()
                    }
                    .scaledToFill()
                    .frame(width: 350, height: 195)
                    .background(.ultraThinMaterial)
                    .shadow(radius: 20)
                    .cornerRadius(8.0)
                }
            }
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
                .offset(y: 115)
            }
        }
        .frame(height: 250)
        .onReceive(timer) { _ in
            withAnimation(.default) {
                selectedImageIndex = (selectedImageIndex + 1) % data.count
            }
        }
    }
}

#Preview {
    Carousel(data: HomeViewModel().movies)
        .preferredColorScheme(.dark)
}
