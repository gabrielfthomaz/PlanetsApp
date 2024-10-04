//
//  FirstView.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 03/10/24.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Fundo()
                
                VStack{
                    
                    
                    VStack{
                        Text("ASTRO AI")
                            .font(.custom("Abel-Regular", size: 60))
                            .foregroundStyle(.gray)
                            .bold()
                            .multilineTextAlignment(.center)
                            .offset(CGSize(width: 0, height: 150))
                            .padding()
                            .overlay(
                                Text("ASTRO AI")
                                    .font(.custom("Abel-Regular", size: 60))
                                    .foregroundStyle(.white)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .offset(CGSize(width: 0, height: 150))
                                    .position(CGPoint(x: 120, y: 52))
                            )
                    }.frame(width: 400, height: .infinity)
 
                    NavigationLink(destination: AstroAI()){
                        VStack{
                            Spacer()
                        ZStack{
                                Spacer()
                                Rectangle()
                                    .frame(width: .infinity, height: .infinity)
                                    .background(.white)
                                    .opacity(0.2)
                                    .cornerRadius(3.0)
                                
                                Text("Encontre um objeto no céu")
                                    .font(.custom("Abel-Regular", size: 20))
                                    .foregroundStyle(.white)
                                    .bold()
                                    .multilineTextAlignment(.center)
                            }.frame(width: 280, height: 60)
                            
                        }
                    }
                    HStack{
                        Text("Conheça mais sobre o Sistema Solar")
                            .font(.custom("Abel-Regular", size: 20))
                            .foregroundStyle(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        // .padding()
                        Image(systemName: "greaterthan")
                            .foregroundStyle(.white)
                            .font(.system(size: 30))
                            .bold()
                            .opacity(0.6)
                            .cornerRadius(3.0)
                    }.offset(CGSize(width: 0, height: 150))
                    
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
