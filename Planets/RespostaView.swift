//
//  RespostaView.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 04/10/24.
//

import SwiftUI
import GoogleGenerativeAI

struct RespostaView: View {
    
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
                    ZStack{
                        Rectangle()
                            .frame(width: 350, height: 700)
                            .background(.white)
                            .opacity(0.2)
                            .cornerRadius(8.0)
                        Text(aiResponse)
                            .foregroundStyle(.white)
                            .font(.system(size: 18))
                            .frame(width: 350, height: 700)
                    }
                    
                }
            }
        }.onAppear(){
            
            fraseRecebida = "Gostaria de ajuda somente para identificar um corpo celeste no céu de onde estou, as infomações que tenho são: \n Estou em \(recebeAI.localX) \n O corpo celeste que estou buscando e está a \(recebeAI.direcao) de \(recebeAI.perto) \n Tem a coloração \(recebeAI.cor) \n \(recebeAI.movimento) está se movendo em relação a outros corpos \n No horário \(recebeAI.hora) \n Na data \(recebeAI.dataX) \n Me diga qual corpo celeste pode ser e algumas referencias de outros corpos em volta para me ajudar! Responda de forma sucinta e direta. Somente com DUAS FRASES."
            
            sendMessage()
        }
    }
}

#Preview {
    RespostaView()
}
