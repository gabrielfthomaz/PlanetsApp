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
                    
                        VStack{
                            
                            NavigationLink(destination: AstroAI()){
                                VStack{
                                    
                                    Spacer()
                                    ZStack{
                                        Spacer()
                                        Rectangle()
                                            .frame(width: .infinity, height: .infinity)
                                            .foregroundColor(.white)
                                            .opacity(0.8)
                                            .cornerRadius(8)
                                            .position(CGPoint(x: 136, y: 34))
                                            .overlay(
                                                Rectangle()
                                                    .frame(width: .infinity, height: .infinity)
                                                    .foregroundColor(.gray)
                                                // .opacity(0.8)
                                                    .cornerRadius(8)
                                            )
                                        Text("Encontre um objeto no céu")
                                            .font(.custom("Abel-Regular", size: 20))
                                            .foregroundStyle(.white)
                                            .bold()
                                            .multilineTextAlignment(.center)
                                    }.frame(width: 280, height: 60)
                                        .padding()
                                    
                                }//.frame(width: 0, height: 300)
                            }
                            NavigationLink(destination: DicasView()){
                                ZStack{
                                    Spacer()
                                    Rectangle()
                                        .frame(width: .infinity, height: .infinity)
                                        .foregroundColor(.white)
                                        .opacity(0.8)
                                        .cornerRadius(8)
                                        .position(CGPoint(x: 136, y: 34))
                                        .overlay(
                                            Rectangle()
                                                .frame(width: .infinity, height: .infinity)
                                                .foregroundColor(.gray)
                                            // .opacity(0.8)
                                                .cornerRadius(8)
                                        )
                                    HStack{
                                        Text("Dicas")
                                            .font(.custom("Abel-Regular", size: 20))
                                            .foregroundStyle(.white)
                                            .bold()
                                            .multilineTextAlignment(.center)
                                        
                                        Image(systemName: "sparkle.magnifyingglass")
                                            .foregroundColor(.white)
                                    }
                                }.frame(width: 280, height: 60)
                            }
                        }
                    }
                    Spacer()
                    ZStack{
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
                        VStack(){
                            //Spacer()
                            Rectangle()
                                .foregroundColor(.white)
                                .opacity(0.8)
                                .frame(width: 350, height: 70)
                                .cornerRadius(40).overlay(
                                    
                                    Rectangle()
                                        .foregroundColor(.gray)
                                        .opacity(0.8)
                                        .frame(width: 340, height: 60)
                                        .cornerRadius(34)
                                    
                                    
                                )
                        }.offset(CGSize(width: 0, height: 180))
                    }
                }
            }
        }.tint(.white)
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
