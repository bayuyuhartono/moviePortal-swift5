//
//  HomeView.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 06/08/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Carousel(imageNames: ["https://www.komar.de/media/cms/fileadmin/user_upload/Category/Fototapeten/Marvel/komar-fototapeten-marvel.jpg", "https://asikcuy.com/wp-content/uploads/2021/04/justice-league.jpg"])
        }
    }
}

#Preview {
    HomeView()
}
