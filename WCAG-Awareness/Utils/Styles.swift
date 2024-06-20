//
//  Styles.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct AccessibiliyLevelStyle: ViewModifier {
    let accessibilityLevel: AccessibilityLevel

    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical)
            .frame(width: 40)
            .background(accessibilityLevel.color)
            .clipShape(.circle)
    }
}

extension View {
    func accessibiliyLevelStyle(_ accessibilityLevel: AccessibilityLevel) -> some View {
        modifier(AccessibiliyLevelStyle(accessibilityLevel: accessibilityLevel))
    }
}

struct ButtonAccessibilityStyle: ButtonStyle {
    let selected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(selected ? .blue : .white)
            .foregroundStyle(selected ? .white : .blue)
            .clipShape(Capsule())
            .font(.callout)
    }
}
