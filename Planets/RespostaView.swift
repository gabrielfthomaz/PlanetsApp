//
//  RespostaView.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 04/10/24.
//

import SwiftUI
import GoogleGenerativeAI

struct RespostaView: View {
    
    @State private var isFavorite = false
    let timerBrain = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    
    @State var recebeAI : Tudo = Tudo(localX: "", perto: "", direcao: "", cor: "", movimento: "", dataX: "", hora: "")
    
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
    
    
    
    @State var frase: String = ""
    @State var fraseRecebida: String = ""
    
    @State var aiResponse: String = "X"
    
    
    func sendMessage() {
        
        aiResponse = ""
        
        Task {
            do {
                let response = try await model.generateContent(frase)
                
                guard let text = response.text else  {
                    frase = "Não entendi.\n Tente novamente!."
                    return
                }
                
                frase = fraseRecebida
                aiResponse = text
                
            } catch {
                aiResponse = "Algo deu errado: \n \(error.localizedDescription)"
            }
        }
    }
    
    
    var body: some View {
        
        VStack{
            ZStack{
                Image("backgroundPlanets")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    //                    VStack{
                    //                      Robot()
                    //
                    //                    }
         
                   // Spacer()
                    VStack{
                        
                        Image(systemName: "brain.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                            .symbolEffect(.bounce.down, value: isFavorite)
                            .font(.largeTitle)
                            .onReceive(timerBrain) { _ in
                                isFavorite.toggle()
                            }
                            .padding()
                        
                        ZStack{
                            Rectangle()
                                .frame(width: 350, height: 500)
                                .foregroundColor(.white)
                                .opacity(0.8)
                                .cornerRadius(6.0)
                                .offset(x: -4, y: 4)
                            Rectangle()
                                .frame(width: 350, height: 500)
                                .foregroundColor(.gray)
                                .opacity(0.7)
                                .cornerRadius(6.0)
                                .overlay(
                                    VStack{
                                        Text(aiResponse)
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                    }
                                )
                            
                        }
                        
                    }
                    
                    Spacer()
                    HStack{
                        Spacer()
                        Text("by GEMINI")
                            .padding()
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .bold()
                        Spacer()
                        
                    }
                }
            }
            
            
        }
    }
    
}

#Preview {
    RespostaView()
}
