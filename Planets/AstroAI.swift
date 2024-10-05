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
    @State private var showingSheet = false

    @State var recebe : Tudo = Tudo(localX: "", perto: "", direcao: "", cor: "", movimento: "", dataX: "", hora: "")
    

    
    
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
                        
                        Button{
                            showingSheet.toggle()
                            fraseRecebida = "Gostaria de ajuda somente para identificar um corpo celeste no céu de onde estou, as infomações que tenho são: \n Estou em \(recebeAI.localX) \n O corpo celeste que estou buscando e está a \(recebeAI.direcao) de \(recebeAI.perto) \n Tem a coloração \(recebeAI.cor) \n \(recebeAI.movimento) está se movendo em relação a outros corpos \n No horário \(recebeAI.hora) \n Na data \(recebeAI.dataX) \n Me diga qual corpo celeste pode ser e algumas referencias de outros corpos em volta para me ajudar! Responda de forma sucinta e direta. Somente com DUAS FRASES."
                            
                            sendMessage()
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
                       }       .sheet(isPresented: $showingSheet) {
                           Text(aiResponse)
                       }
                    }
                }
            }
        }
    }
}

#Preview {
    AstroAI()
}
