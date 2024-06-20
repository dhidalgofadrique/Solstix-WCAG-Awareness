//
//  GuidelineView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct GuidelineView<Content: View>: View {
    @ViewBuilder let content: Content
    var showRealityButton: Bool = true
    var onAccessibilityStatusChange: ((_ accessibilityStatus: AccessibilityStatus) -> Void)? = nil

    @State var selectedAccessibilityStatus: AccessibilityStatus = .default

    var body: some View {
        VStack {
            content
            Spacer()
            HStack(spacing: 8) {
                Button("Por defecto") {
                    selectedAccessibilityStatus = .default
                }
                .buttonStyle(ButtonAccessibilityStyle(selected: selectedAccessibilityStatus == .default))
                if showRealityButton {
                    Button("Realidad") {
                        selectedAccessibilityStatus = .reality
                    }
                    .buttonStyle(ButtonAccessibilityStyle(selected: selectedAccessibilityStatus == .reality))
                } else {
                    Spacer()
                }
                Button("Accesible") {
                    selectedAccessibilityStatus = .accessible
                }
                .buttonStyle(ButtonAccessibilityStyle(selected: selectedAccessibilityStatus == .accessible))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.gray)
        }
        .frame(maxWidth: .infinity)
        .onChange(of: selectedAccessibilityStatus, perform: { selectedAccessibilityStatus in
            onAccessibilityStatusChange?(selectedAccessibilityStatus)
        })
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    GuidelineView {
        Text("Test")
    }
}
