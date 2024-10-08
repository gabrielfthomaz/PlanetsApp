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
        NavigationStack{
            ZStack {
                Image("backgroundPlanets")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.9)
                VStack{
                    ZStack{
                        VStack{
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
                                            VStack{
                                                ZStack{
                                                    Rectangle()
                                                        .frame(width: .infinity, height: 50)
                                                        .background(.white)
                                                        .opacity(0.2)
                                                        .cornerRadius(3.0)
                                                    
                                                    Text(index.name)
                                                        .foregroundStyle(.white)
                                                        .font(.system(size: 35))
                                                        .bold()
                                                }
                                            }
                                        }
                                        VStack{
                                            
                                            HStack{
                                                Box().overlay(
                                                    VStack{
                                                        Text("Diâmetro:")
                                                            .foregroundStyle(.cyan)
                                                            .font(.system(size: 20))
                                                            .bold()
                                                            .padding(2)
                                                        //  Spacer()
                                                        Text("\(index.diameter_km)")
                                                            .foregroundStyle(.white)
                                                            .font(.system(size: 20))
                                                        
                                                        //  Spacer()
                                                        Text("Km")
                                                            .foregroundStyle(.cyan)
                                                            .font(.system(size: 20))
                                                            .padding(2)
                                                    }
                                                )
                                                Box().overlay(
                                                    VStack{
                                                        Text("Luas:")
                                                            .foregroundStyle(.cyan)
                                                            .font(.system(size: 20))
                                                            .bold()
                                                            .padding(2)
                                                        //  Spacer()
                                                        Text("\(index.moons)")
                                                            .foregroundStyle(.white)
                                                            .font(.system(size: 20))
                                                        // .bold()
                                                        //  Spacer()
                                                        Text("Satélites Naturais")
                                                            .foregroundStyle(.cyan)
                                                            .font(.system(size: 20))
                                                            .padding(2)
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
                                                       // .padding()
                                                        .frame(width: 350, height: .infinity)
                                                    // .multilineTextAlignment(.trailing)
                                                }
                                            )
                                            
                                        }
                                    }
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
                        }.padding(.vertical)
                        VStack(){
                            Spacer()
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
                        }
                        .offset(CGSize(width: 0, height: 60))
                    }
                }
                
            }
            //.padding()
        }
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
