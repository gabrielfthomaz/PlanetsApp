//
//  AstroAI.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 04/10/24.
//

import SwiftUI
import GoogleGenerativeAI

struct Tudo {
    var localX: String
    var perto: String
    var direcao: String
    var cor: String
    var movimento: String
    var dataX: String
    var hora: String
    
}

struct AstroAI: View {
    
    @State var recebe : Tudo = Tudo(localX: "", perto: "", direcao: "", cor: "", movimento: "", dataX: "", hora: "")
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backgroundPlanets")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                  
                    VStack {
                        VStack{
                            VStack{
                                Text("Onde você está (Cidade/Estado/País)?")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                
                                Text("(Ex: Nova Friburgo, Rio de Janeiro, Brasil.)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 35)
                                        .background(.white)
                                        .opacity(0.2)
                                        .cornerRadius(3.0)
                                    
                                    TextField("Enter a message", text: $recebe.localX)
                                        .textFieldStyle(.plain)
                                        .foregroundStyle(.black)
                                        .frame(width: 350, height: 15)
                                }
     
                            }
                            VStack {
                                Text("Algum corpo celeste reconhecido próximo?")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                
                                
                                Text("(Ex: As “três marias”)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 35)
                                        .background(.white)
                                        .opacity(0.2)
                                        .cornerRadius(3.0)
                                    
                                    TextField("Enter a message", text: $recebe.perto)
                                        .textFieldStyle(.plain)
                                        .foregroundStyle(.black)
                                        .frame(width: 350, height: 15)
                                }
                            }
                            VStack {
                                Text("Esse objeto está perto do que procura?")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                
                                Text("(Ex: Esquerda/Direita/Abaixo/Acima)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 35)
                                        .background(.white)
                                        .opacity(0.2)
                                        .cornerRadius(3.0)
                                    
                                    TextField("Enter a message", text: $recebe.direcao)
                                        .textFieldStyle(.plain)
                                        .foregroundStyle(.black)
                                        .frame(width: 350, height: 15)
                                }
                            }
                            VStack {
                                Text("Qual a coloração do corpo celeste?")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                
                                Text("(Ex: Azul/Vermelho)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 35)
                                        .background(.white)
                                        .opacity(0.2)
                                        .cornerRadius(3.0)
                                    
                                    TextField("Enter a message", text: $recebe.cor)
                                        .textFieldStyle(.plain)
                                        .foregroundStyle(.black)
                                        .frame(width: 350, height: 15)
                                }
                            }
                            VStack {
                                Text("O objeto se move rapidamente?")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                
                                Text("(Ex: Sim/Não)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 35)
                                        .background(.white)
                                        .opacity(0.2)
                                        .cornerRadius(3.0)
                                    
                                    TextField("Enter a message", text: $recebe.movimento)
                                        .textFieldStyle(.plain)
                                        .foregroundStyle(.black)
                                        .frame(width: 350, height: 15)
                                }
                            }
                            VStack {
                                Text("Que horas você observou o objeto?")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                
                                Text("(Ex: 20:30)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 35)
                                        .background(.white)
                                        .opacity(0.2)
                                        .cornerRadius(3.0)
                                    
                                    TextField("Enter a message", text: $recebe.hora)
                                        .textFieldStyle(.plain)
                                        .foregroundStyle(.black)
                                        .frame(width: 350, height: 15)
                                }
                            }
                            VStack {
                                Text("Que data foi identificado")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                
                                Text("(Ex:dia/mês/ano)")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 35)
                                        .background(.white)
                                        .opacity(0.2)
                                        .cornerRadius(3.0)
                                    
                                    TextField("Enter a message", text: $recebe.dataX)
                                        .textFieldStyle(.plain)
                                        .foregroundStyle(.black)
                                        .frame(width: 350, height: 15)
                                }
                            }
                            
                        }.padding(20)
                        
                        NavigationLink{
                            RespostaView(recebeAI: recebe)
                        } label: {
                            ZStack{
                                
                                Rectangle()
                                    .frame(width: 140, height: 55)
                                    .background(.white)
                                    .opacity(0.2)
                                    .cornerRadius(3.0)
                                
                                HStack{
                                    Text("Encontrar")
                                    Image(systemName: "moon.stars.circle")
                                }.foregroundColor(.white)
                            }.foregroundColor(.gray)
                       }
                                .onTapGesture {

                          
                            
                      
                        }
                        //Text(aiResponse)
                    }
                }
            }
        }
    }
}

#Preview {
    AstroAI()
}
