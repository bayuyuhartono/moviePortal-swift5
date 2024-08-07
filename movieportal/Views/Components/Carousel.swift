//
//  Carousel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 06/08/24.
//

import SwiftUI

struct Carousel: View {
    @State private var selectedImageIndex: Int = 0

    var imageNames: [String]
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.secondary
                .ignoresSafeArea()

            TabView(selection: $selectedImageIndex) {
                ForEach(0..<imageNames.count, id: \.self) { index in
                    ZStack(alignment: .topLeading) {
                        AsyncImage(url: URL(string: imageNames[index])) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .scaledToFill()
                    .frame(width: 350, height: 190)
                    .background(.ultraThinMaterial)
                    .shadow(radius: 20)
                    .cornerRadius(8.0)
                }
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()

            HStack {
                ForEach(0..<imageNames.count, id: \.self) { index in
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
        .onReceive(timer) { _ in
            withAnimation(.default) {
                selectedImageIndex = (selectedImageIndex + 1) % imageNames.count
            }
        }
    }
}

#Preview {
    Carousel(imageNames: ["https://asikcuy.com/wp-content/uploads/2021/04/justice-league.jpg", "https://www.komar.de/media/cms/fileadmin/user_upload/Category/Fototapeten/Marvel/komar-fototapeten-marvel.jpg"])
}
