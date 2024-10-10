//
//  DicasView.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 08/10/24.
//

import SwiftUI

struct DicasView: View {
    var body: some View {
        VStack{
            ZStack {
                Image("backgroundPlanets")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.9)
                VStack{
                    HStack{
                        Text("Dicas")
                            .font(.custom("Abel-Regular", size: 40))
                            .foregroundStyle(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                        Image(systemName: "sparkle.magnifyingglass")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                    HStack{
                        Text("Localize-se:")
                            .font(.custom("Abel-Regular", size: 30))
                            .foregroundStyle(.white)
                            .bold()
                            //.multilineTextAlignment(.center)
                           // .padding()
                        Spacer()
                    }
                    ScrollView{
                        VStack{
                            Text("As Três Marias são três estrelas brilhantes que formam o cinturão da constelação de Órion, facilmente identificáveis a olho nu como um trio alinhado no céu noturno")
                                .font(.custom("Abel-Regular", size: 20))
                                .foregroundStyle(.white)
                                .bold()
                              
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.white)
                                    .opacity(0.8)
                                    .frame(width: 330, height: 230)
                                    .cornerRadius(15)
                                    .overlay(
                                        
                                        Rectangle()
                                            .foregroundColor(.gray)
                                            .opacity(0.8)
                                            .frame(width: 320, height: 220)
                                            .cornerRadius(10)
                                        
                                        
                                    )
                                Image("tresmarias")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                            }
                            
                            Text("O Cruzeiro do Sul é um dos grupos de estrelas mais conhecidos do Hemisfério Sul. Procure por uma cruz pequena e brilhante formada por quatro estrelas principais. A partir desse ponto de referência, você pode localizar outros astros e constelações.")
                                .font(.custom("Abel-Regular", size: 20))
                                .foregroundStyle(.white)
                                .bold()
                               
                        
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.white)
                                    .opacity(0.8)
                                    .frame(width: 330, height: 230)
                                    .cornerRadius(15)
                                    .overlay(
                                        
                                        Rectangle()
                                            .foregroundColor(.gray)
                                            .opacity(0.8)
                                            .frame(width: 320, height: 220)
                                            .cornerRadius(10)
                                        
                                        
                                    )
                                Image("cruzeirodos")
                                    .resizable()
                                    .frame(width: 300, height: 200)
                            }
                            Text("Alfa e Beta Centauri são duas das estrelas mais brilhantes do céu noturno e estão localizadas na constelação de Centauro. Embora não façam parte da formação do Cruzeiro do Sul, são estrelas importantes para a orientação no hemisfério sul e são frequentemente vistas próximas a essa constelação. ")
                                .font(.custom("Abel-Regular", size: 20))
                                .foregroundStyle(.white)
                                .bold()
                               
                            VStack(){
                                //Spacer()
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .opacity(0.8)
                                        .frame(width: 330, height: 230)
                                        .cornerRadius(15)
                                        .overlay(
                                            
                                            Rectangle()
                                                .foregroundColor(.gray)
                                                .opacity(0.8)
                                                .frame(width: 320, height: 220)
                                                .cornerRadius(10)
                                            
                                            
                                        )
                                    Image("alphaebeta")
                                        .resizable()
                                        .frame(width: 300, height: 200)
                                }
                            }
             
                        }
                    }
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    DicasView()
}
