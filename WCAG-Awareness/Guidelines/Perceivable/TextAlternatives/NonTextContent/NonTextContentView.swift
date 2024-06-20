//
//  NonTextContentView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct NonTextContentView: View {
    @State var captionOpacity: Double = 0
    @State var blurRadius: Double = 0
    @State var selectedAccessibilityStatus: AccessibilityStatus = .default

    var body: some View {
        GuidelineView {
            VStack {
                ZStack {
                    Image("simpsonsHouse")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .blur(radius: blurRadius)
                }
                .frame(width: 400, height: 200)
                Text("🎵 An image of Simpsons house 🎵")
                    .opacity(captionOpacity)
                    .padding(.top, 20)
            }
            .padding()
        } onAccessibilityStatusChange: { accessibilityStatus in
            switch accessibilityStatus {
            case .default:
                withAnimation {
                    captionOpacity = 0
                    blurRadius = 0
                }
            case .reality:
                withAnimation {
                    captionOpacity = 0
                    blurRadius = 10
                }
            case .accessible:
                withAnimation {
                    captionOpacity = 1
                    blurRadius = 10
                }
            }
        }
    }
}

#Preview {
    NonTextContentView()
}
