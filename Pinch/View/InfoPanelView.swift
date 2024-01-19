//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Nickelfox on 05/01/24.
//

import SwiftUI

struct InfoPanelView: View {
    @State var scale:CGFloat
    @State var Offset:CGSize
    @State private var isInfoPanelVisible:Bool = false
    var body: some View {
        HStack{
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30,height: 30)
                .onLongPressGesture(minimumDuration: 1){
                    withAnimation(.easeOut){
                        isInfoPanelVisible.toggle()
                    }
                }
            
            
            
            Spacer()
            HStack(spacing: 2){
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(Offset.width)")
                Spacer()
                
                Image("arrow.up.and.down")
                Text("\(Offset.height)")
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            Spacer()
        }
    }
}

#Preview {
    InfoPanelView(scale: 1, Offset: .zero)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
}
