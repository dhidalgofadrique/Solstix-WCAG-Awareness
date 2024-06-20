//
//  RobustView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct RobustView: View {
    var body: some View {
        VStack {
            Text("Robusto")
                .font(.largeTitle)
            Spacer()
            Image("toDo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
}

#Preview {
    RobustView()
}
