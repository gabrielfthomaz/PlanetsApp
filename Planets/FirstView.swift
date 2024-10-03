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
                AsyncImage(url: URL(string: "https://www.imagensempng.com.br/wp-content/uploads/2022/02/34324.png")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 250, height: 250)
                .shadow(radius: 20)
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
            .edgesIgnoringSafeArea(.all)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(Animation.linear(duration: 20).repeatForever(autoreverses: false)) {
                    rotation = 40
                }
            }
    }
}
#Preview {
    FirstView()
}
