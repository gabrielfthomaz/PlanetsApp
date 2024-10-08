//
//  TabView.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 03/10/24.
//

import SwiftUI

struct TabVieww: View {
    

    var body: some View {
        NavigationStack{
            TabView {
                FirstView()
                    .tabItem {
                            Label("Home", systemImage: "house.circle.fill")
                    }
                
                ContentView()
                    .tabItem {
                        Label("Sistema Solar", systemImage: "sun.max.circle.fill")
                    }
                
            } //  .tabViewStyle(.page)
                .ignoresSafeArea()
                .accentColor(.white)
               }

             }
        }

#Preview {
    TabVieww()
}

