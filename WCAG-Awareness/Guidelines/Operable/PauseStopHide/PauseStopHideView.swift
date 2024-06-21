//
//  PauseStopHideView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

enum AccessibilityBlinkStatus {
    case `default`
    case reality
    case accessible(isPaused: Bool)
}

struct PauseStopHideView: View {
    @State var currentAccessibilityStatus: AccessibilityBlinkStatus = .default

    var body: some View {
        GuidelineView {
            VStack {
                Image("diTuFrase")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Venga, Bart, ¡di tu frase!")
                    .font(.largeTitle)
                    .padding(.bottom, 40)
                switch currentAccessibilityStatus {
                case .default:
                    Text("... ... Yo no he sido")
                        .font(.largeTitle)
                        .blinking(duration: 2)
                case .reality:
                    Text("... ... Yo no he sido")
                        .font(.largeTitle)
                        .blinking(duration: 0.05)
                case .accessible(let isPaused):
                    if isPaused {
                        Text("... ... Yo no he sido")
                            .font(.largeTitle)
                    } else {
                        Text("... ... Yo no he sido")
                            .font(.largeTitle)
                            .blinking(duration: 3)
                    }
                }
                Spacer()
                if case .accessible = currentAccessibilityStatus {
                    Button {
                        currentAccessibilityStatus = .accessible(isPaused: true)
                    } label: {
                        Text("Pausar/Reanudar animaciones")
                            .foregroundStyle(.white)
                    }
                    .padding(12)
                    .background(.blue)
                    .clipShape(Capsule())
                }
            }
        } onAccessibilityStatusChange: { accessibilityStatus in
            switch accessibilityStatus {
            case .default:
                currentAccessibilityStatus = .default
            case .reality:
                currentAccessibilityStatus = .reality
            case .accessible:
                currentAccessibilityStatus = .accessible(isPaused: false)
            }
        }
    }
}

#Preview {
    PauseStopHideView()
}

struct BlinkViewModifier: ViewModifier {
    let duration: Double
    @State private var blinking: Bool = false

    func body(content: Content) -> some View {
        content
            .opacity(blinking ? 0 : 1)
            .animation(.easeOut(duration: duration).repeatForever(), value: blinking)
            .onAppear {
                withAnimation {
                    blinking = true
                }
            }
    }
}

extension View {
    func blinking(duration: Double = 0.75) -> some View {
        modifier(BlinkViewModifier(duration: duration))
    }
}
