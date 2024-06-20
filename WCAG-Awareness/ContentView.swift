//
//  ContentView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PerceivableView()
                .tabItem {
                    Label("Perceptible", systemImage: "eye")
                }
            OperableView()
                .tabItem {
                    Label("Operable", systemImage: "keyboard")
                }
            UnderstandableView()
                .tabItem {
                    Label("Comprensible", systemImage: "brain")
                }
            RobustView()
                .tabItem {
                    Label("Robusto", systemImage: "macbook.and.iphone")
                }
        }
    }
}

#Preview {
    ContentView()
}
