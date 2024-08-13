//
//  Badge.swift
//  movieportal
//
//  Created by Bayu P Yuhartono on 12/08/24.
//

import SwiftUI

struct Badge: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(.uiSmoke)
            .font(.headline)
            .fontWeight(.bold)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.uiCharcoal.opacity(0.5))
            .cornerRadius(40)
    }
}

#Preview {
    Badge(text: "2024")
}
