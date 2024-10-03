//
//  FirstView.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 03/10/24.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        ZStack{
            Fundo()
                
            VStack{
                
                Spacer()
                VStack{
                    Text("Sistema Solar")
                        .font(.custom("Abel-Regular", size: 60))
                        .foregroundStyle(.gray)
                        .bold()
                        .multilineTextAlignment(.center)
                        .offset(CGSize(width: 0, height: 150))
                        .padding()
                        .overlay(
                            Text("Sistema Solar")
                                .font(.custom("Abel-Regular", size: 60))
                                .foregroundStyle(.white)
                                .bold()
                                .multilineTextAlignment(.center)
                                .offset(CGSize(width: 0, height: 150))
                                .position(CGPoint(x: 177, y: 52))
                        )
                }.frame(width: 400, height: .infinity)
               
               Spacer()
                AsyncImage(url: URL(string: "https://www.imagensempng.com.br/wp-content/uploads/2022/02/34324.png")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 600, height: 600)
                .shadow(radius: 20)
                .offset(CGSize(width: 0, height: 200))
                //.rotationEffect(.degrees(270))
            }
        }
    }
}
struct Fundo: View  {
    @State private var rotation: Double = 0
    var body: some View {
        Image("fundo")
            .resizable()
            .scaledToFill()
            .frame(width: 1000, height: 1000)
            .opacity(0.97)
            .edgesIgnoringSafeArea(.all)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(Animation.linear(duration: 20).repeatForever(autoreverses: false)) {
                    rotation = 20
                }
            }
    }
}
#Preview {
    FirstView()
}
