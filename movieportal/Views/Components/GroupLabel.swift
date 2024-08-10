//
//  GroupLabel.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 10/08/24.
//

import SwiftUI

struct GroupLabel: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.title2)
                .foregroundStyle(.uiSmoke)
            Spacer()
            Text("See all")
                .foregroundStyle(.uiYellow)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    GroupLabel(text: "Popular")
        .preferredColorScheme(.dark)
}
