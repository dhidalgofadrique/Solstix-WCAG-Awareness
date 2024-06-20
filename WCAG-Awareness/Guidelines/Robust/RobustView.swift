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
            Spacer()
            Text("Robusto")
                .font(.largeTitle)
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
