//
//  TabView.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 03/10/24.
//

import SwiftUI

struct TabVieww: View {
    
    var body: some View {
        
        TabView {
            FirstView()
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            
            ContentView()
                .tabItem {
                    Label("Order", systemImage: "ellipsis.circle.fill")
                }
            
        }   .tabViewStyle(.page)
            .ignoresSafeArea()
          //  .tint(.black)
        //            .onAppear(perform: {
        //                //2
        //                UITabBar.appearance().unselectedItemTintColor = .systemGray
        //                //3
        //                UITabBarItem.appearance().badgeColor = .systemPink
        //                //4
        //                UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.9)
        //                //5
        //                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
        //                //UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        //                //Above API will kind of override other behaviour and bring the default UI for TabView
        //            })
    }
}

#Preview {
    TabVieww()
}

