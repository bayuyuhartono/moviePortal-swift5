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
                Text("Home")
                    .tag(0)
                Text("Bookmark")
                    .tag(1)
                Text("Profile")
                    .tag(2)
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
            .frame(height: 50)
            .background(.uiCharcoal)
            .cornerRadius(35)
            .padding(.horizontal, 26)
        }
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
        .frame(width: isActive ? .infinity : 60, height: 40)
        .background(isActive ? .uiYellow : .clear)
        .cornerRadius(30)
    }
}

#Preview {
    MainView()
}
