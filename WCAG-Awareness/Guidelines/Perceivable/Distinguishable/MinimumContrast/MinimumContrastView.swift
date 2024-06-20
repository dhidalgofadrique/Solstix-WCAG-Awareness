//
//  MinimumContrastView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct ColorCombination: Identifiable {
    let id: UUID
    let background: Color
    let foreground: Color
    let text: String

    init(background: Color, foreground: Color, text: String) {
        id = UUID()
        self.background = background
        self.foreground = foreground
        self.text = text
    }

    static let badColors: [ColorCombination] = [
        ColorCombination(background: .black, foreground: .blue, text: "Sin tele"),
        ColorCombination(background: .orange, foreground: .green, text: "y sin cerveza"),
        ColorCombination(background: .green, foreground: .red, text: "Homer pierde"),
        ColorCombination(background: .purple, foreground: .gray, text: "¡La cabeza! ¡Uuuuuh!")
    ]

    static let realColors: [ColorCombination] = [
        ColorCombination(background: .init(red: 0.8, green: 0.8, blue: 0.8), foreground: .init(red: 0.84, green: 0.84, blue: 0.84), text: "Sin tele"),
        ColorCombination(background: .init(red: 0.7, green: 0.7, blue: 0.7), foreground: .init(red: 0.73, green: 0.73, blue: 0.73), text: "y sin cerveza"),
        ColorCombination(background: .init(red: 0.7, green: 0.7, blue: 0.7), foreground: .init(red: 0.76, green: 0.76, blue: 0.76), text: "Homer pierde"),
        ColorCombination(background: .init(red: 0.6, green: 0.6, blue: 0.6), foreground: .init(red: 0.65, green: 0.65, blue: 0.65), text: "¡La cabeza! ¡Uuuuuh!")
    ]

    static let goodColors: [ColorCombination] = [
        ColorCombination(background: .black, foreground: .yellow, text: "Sin tele"),
        ColorCombination(background: .init(red: 0.8, green: 0.8, blue: 0.8), foreground: .init(red: 0.4, green: 0.4, blue: 0.4), text: "Sin tele"),
        ColorCombination(background: .orange, foreground: .black, text: "y sin cerveza"),
        ColorCombination(background: .init(red: 0.8, green: 0.8, blue: 0.8), foreground: .init(red: 0.4, green: 0.4, blue: 0.4), text: "y sin cerveza"),
        ColorCombination(background: .green, foreground: .black, text: "Homer pierde"),
        ColorCombination(background: .init(red: 0.8, green: 0.8, blue: 0.8), foreground: .init(red: 0.4, green: 0.4, blue: 0.4), text: "Homer pierde"),
        ColorCombination(background: .purple, foreground: .white, text: "¡La cabeza! ¡Uuuuuh!"),
        ColorCombination(background: .init(red: 0.8, green: 0.8, blue: 0.8), foreground: .init(red: 0.4, green: 0.4, blue: 0.4), text: "¡La cabeza! ¡Uuuuuh!")
    ]
}

struct MinimumContrastView: View {
    @State var currentColors = ColorCombination.badColors

    var body: some View {
        GuidelineView {
            VStack(spacing: 30) {
                Image("elResplandor")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(spacing: 0) {
                    ForEach(currentColors) { color in
                        Text(color.text)
                            .foregroundStyle(color.foreground)
                            .frame(width: 300, height: 52)
                            .background {
                                Rectangle()
                                    .fill(color.background)
                            }

                    }
                }
                Spacer()
            }
            .padding()
        } onAccessibilityStatusChange: { accessibilityStatus in
            switch accessibilityStatus {
            case .default:
                withAnimation {
                    currentColors = ColorCombination.badColors
                }
            case .reality:
                withAnimation {
                    currentColors = ColorCombination.realColors
                }
            case .accessible:
                withAnimation {
                    currentColors = ColorCombination.goodColors
                }
            }
        }
    }
}

#Preview {
    MinimumContrastView()
}
