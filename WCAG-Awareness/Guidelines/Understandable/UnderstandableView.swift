//
//  UnderstandableView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct UnderstandableView: View {
    var body: some View {
        VStack {
            Text("Comprensible")
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
    UnderstandableView()
}
