//
//  GuidelineCell.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct GuidelineCell<Content: View>: View {
    let title: String
    let accessibilityLevel: AccessibilityLevel

    @ViewBuilder let content: Content

    var body: some View {
        NavigationLink(destination: content) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Text(accessibilityLevel.rawValue)
                    .accessibiliyLevelStyle(accessibilityLevel)
            }
        }
    }
}

#Preview {
    GuidelineCell(
        title: "1.1.1 Non-text Content",
        accessibilityLevel: .A
    ) {
        Text("Cell content")
    }
}
