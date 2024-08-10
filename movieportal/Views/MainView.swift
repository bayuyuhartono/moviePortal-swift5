//
//  ContentView.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 06/08/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                    .toolbar(.hidden, for: .tabBar)
                Text("Bookmark")
                    .tag(1)
                    .toolbar(.hidden, for: .tabBar)
                Text("Profile")
                    .tag(2)
                    .toolbar(.hidden, for: .tabBar)
            }

            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(8)
            }
            .frame(height: 60)
            .background(.uiCharcoal)
            .cornerRadius(40)
            .padding(.horizontal, 32)
        }
        .padding(.bottom, 16)
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }
}


extension MainView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .uiBlack : .uiSmoke)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .uiBlack : .white)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 50)
        .background(isActive ? .uiYellow : .clear)
        .cornerRadius(40)
    }
}

#Preview {
    MainView()
}
