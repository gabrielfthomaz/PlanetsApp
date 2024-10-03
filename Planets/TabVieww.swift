//
//  TabView.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 03/10/24.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        
        TabView {
                    FirstView()
                        .tabItem {
                            Label("Menu", systemImage: "list.dash")
                        }

                    ContentView()
                        .tabItem {
                            Label("Order", systemImage: "square.and.pencil")
                        }
                }
    }
}

#Preview {
    TabView()
}
