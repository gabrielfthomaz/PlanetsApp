//
//  ContentView.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 20/09/24.
//

import SwiftUI

struct ContentView: View {
    
      let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
     
      @State private var selectedImageIndex: Int = 0
      @StateObject var vm = ViewModel()
      @State  var aux: Astros?
    
    var body: some View {
        

            
            ZStack {
                Image("backgroundPlanets")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.9)

                     TabView(selection: $selectedImageIndex) {
                         
                         ForEach(vm.chars.sorted(by: { $0.eleVem < $1.eleVem }), id: \.self) { index in
                          
                              
                             VStack{
                                 VStack{
                                     HStack{
                                         Image(systemName: "lessthan")
                                             .foregroundStyle(.white)
                                             .font(.system(size: 30))
                                             .bold()
                                             .opacity(0.2)
                                             .cornerRadius(3.0)
                                         AsyncImage(url: URL(string: index.image_url)) { image in
                                             image
                                                 .resizable()
                                                 .aspectRatio(contentMode: .fill)
                                         } placeholder: {
                                             ProgressView()
                                         }
                                         .frame(width: 250, height: 250)
                                         .shadow(radius: 20)
                                         Image(systemName: "greaterthan")
                                             .foregroundStyle(.white)
                                             .font(.system(size: 30))
                                             .bold()
                                             .opacity(0.2)
                                             .cornerRadius(3.0)
                                     }
                                         Text(index.name)
                                             .foregroundStyle(.white)
                                             .font(.system(size: 30))
                                             .bold()
                                         
                                         //                            }.onAppear(){
                                         //                                aux = index
                                         //                            }
                                         
                                   
                                 }
                                 VStack{
                                     
                                     HStack{
                                         Box().overlay(
                                            VStack{
                                                Text("Diâmetro:")
                                                    .foregroundStyle(.cyan)
                                                    .font(.system(size: 20))
                                                    .bold()
                                                    .padding()
                                              //  Spacer()
                                                Text("\(index.diameter_km)")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 20))
                                                   
                                              //  Spacer()
                                                Text("Km")
                                                    .foregroundStyle(.cyan)
                                                    .font(.system(size: 20))
                                                    .padding()
                                            }
                                         )
                                         Box().overlay(
                                            VStack{
                                                Text("Luas:")
                                                    .foregroundStyle(.cyan)
                                                    .font(.system(size: 20))
                                                    .bold()
                                                    .padding()
                                              //  Spacer()
                                                Text("\(index.moons)")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 20))
                                                   // .bold()
                                              //  Spacer()
                                                Text("Satélites Naturais")
                                                    .foregroundStyle(.cyan)
                                                    .font(.system(size: 20))
                                                    .padding()
                                            }
                                         )
                                     }
                                     VStack{
                                         HStack{
                                             ForEach(index.composition.elements, id: \.self){ i in
                                                 VStack{
                                                     Box().overlay(
                                                        VStack{
                                                    
                                                    
                                                            Text(i.element)
                                                                .foregroundStyle(.white)
                                                                .font(.system(size: 20))
                                                                //.bold()
                                          
                                                            Text(i.percentage)
                                                                .foregroundStyle(.white)
                                                                .font(.system(size: 20))
                                                               // .bold()
                                                   
                                                        }
                                                    )
                                                 }
                                        
                                             }
                                         }
                                         Box().overlay(
                                            VStack{
                                                Text("Atmosfera")
                                                    .foregroundStyle(.cyan)
                                                    .font(.system(size: 20))
                                                    .bold()
                                                 //   .padding()
                                                Text(index.composition.atmosphere)
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 20))
                                                   // .bold()
                                            }
                                             )
                                         
                                     }
                                     Box().overlay(
                                        VStack{
                                            Text(index.description)
                                                .foregroundStyle(.white)
                                                .font(.system(size: 20))
                                               // .bold()
                                                .padding()
                                        }
                                     )
                                 }
                             }
//                                 HStack{
//                                     Capsule()
//                                         .fill(Color.white.opacity(selectedImageIndex == Int(index.eleVem) ?? -1 ? 1 : 0.33))
//                                         .frame(width: 35, height: 8)
//                                         .onTapGesture {
//                                             if let indexAsInt = Int(index.eleVem) {
//                                                 selectedImageIndex = indexAsInt
//                                             } else {
//                                                 // Lida com o caso em que a conversão falha (opcional)
//                                                 print("Erro ao converter eleVem para Int")
//                                             }
//                                         }
//                                 }            .offset(y: 130)
                             
                         }
                     }
                  
                     .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                     //.ignoresSafeArea()
                     .onAppear(){
                     vm.fetch()
                 }
                 

                    
                
            }    .onReceive(timer) { _ in
                withAnimation(.default) {
                    if let eleVemInt = Int(aux?.eleVem ?? "0") { // Converte a String para Int
                        selectedImageIndex = (eleVemInt + 1) % (aux?.image_url.count ?? 1)
                    } else {
                        print("eleVem não é um número válido")
                    }
                }
            }
            //.padding()
        
    }
}
struct Box: View {
    var body: some View {
        Rectangle()
            .frame(width: .infinity, height: .infinity)
            .background(.white)
            .opacity(0.2)
            .cornerRadius(3.0)
            
    }
}


#Preview {
    ContentView()
}
