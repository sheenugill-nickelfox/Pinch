//
//  ContentView.swift
//  Pinch
//
//  Created by Nickelfox on 05/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating:Bool = false
    @State var imageScale :CGFloat = 1
    @State var imageOffset : CGSize = .zero
    
    func resetImageState(){
        return withAnimation(Animation.spring()){
            imageScale = 1
            imageOffset = .zero
        }
    }
    var body: some View {
        NavigationView{
            ZStack{
                Color.clear
                Image("magazine-front-cover")
                    .resizable()
                   .aspectRatio(contentMode: .fit)
                  .cornerRadius(10)
                   .padding()
                   .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 12,x:2,y:2)
                   .opacity(isAnimating ?  1 : 0)
                   .offset(x: imageOffset.width,y: imageOffset.height)
                   .scaleEffect(imageScale)
                   .onTapGesture (count: 2, perform: {
                       if imageScale == 1 {
                           withAnimation(Animation.spring()){
                               imageScale = 5
                           }
                       }else{
                           resetImageState()
                       }
                   })
                   .gesture(
                   DragGesture()
                    .onChanged{ gesture in
                        withAnimation(Animation.linear(duration: 1)){
                            imageOffset = gesture.translation
                        }
                    }
                    .onEnded{ gesture in
                        if imageScale <= 1{
                            resetImageState()
                        }
                    })
                 
                
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                withAnimation(Animation.linear(duration: 1)){ isAnimating = true}
            }
            .overlay(InfoPanelView(scale: imageScale, Offset: imageOffset)
                .padding(.horizontal)
                .padding(.top)
                     ,alignment: .top)
            .overlay(
                Group{
                    HStack{
                        Button(action: {
                            withAnimation(Animation.spring()){
                                if imageScale > 1{
                                    imageScale -= 1
                                }
                                if imageScale <= 1{
                                    resetImageState()
                                }
                            }
                        }, label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        })
                        Button(action: {resetImageState()}, label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        })
                        Button(action: {
                            withAnimation(Animation.spring()){
                                if(imageScale < 5){
                                    imageScale += 1
                                }
                                if(imageScale > 5){
                                    imageScale = 5
                                }
                            }
                        }, label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        })
                    }
                    .padding(EdgeInsets(top: 12, leading:20 , bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1: 0)
                }.padding(.bottom,30),alignment:.bottom)
            
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
