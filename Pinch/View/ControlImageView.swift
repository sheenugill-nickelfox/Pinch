//
//  ControlImageView.swift
//  Pinch
//
//  Created by Nickelfox on 05/01/24.
//

import SwiftUI

struct ControlImageView: View {
    let icon : String
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

#Preview {
    ControlImageView(icon: "minus.magnifyingglass")
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        .previewLayout(.sizeThatFits)
        .padding()
}
