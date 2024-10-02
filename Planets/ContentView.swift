//
//  ContentView.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 20/09/24.
//

import SwiftUI

struct ContentView: View {

    @StateObject var vm = ViewModel()
    
    var body: some View {
        
        NavigationStack{
            
            ZStack {
        
                Fundo()
                
                VStack{
                    ScrollView(){
                        ForEach(vm.chars, id: \.eleVem){ i in
                            VStack{
                                NavigationLink(destination: Detalhes()){
                                    AsyncImage(url: URL(string: i.image_url)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .frame(width: 150, height: 150)
                                    
                                    //Text(i.name)
                                }
                            }
                            //.position(CGPoint(x: 1, y: 1))
                        }
                        
                    }.onAppear(){
                        vm.fetch()
                    }
                    
                }
            }
            //.padding()
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
                    rotation = 15
                }
            }
    }
}

#Preview {
    ContentView()
}
