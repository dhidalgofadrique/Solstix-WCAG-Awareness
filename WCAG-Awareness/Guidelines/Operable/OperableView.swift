//
//  OperableView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct OperableView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Operable")
                    .font(.largeTitle)
                List {
                    Section {
                        GuidelineCell(
                            title: "2.2.2 Timing Adjustable",
                            accessibilityLevel: .A
                        ) {
                            TimingAdjustableView()
                        }
                    } header: {
                        Text("2.2 Enough Time")
                    }
                    Section {
                        GuidelineCell(
                            title: "2.4.1 Bypass Blocks",
                            accessibilityLevel: .A
                        ) {
                            BypassBlocksView()
                        }
                    } header: {
                        Text("2.4 Navigable")
                    }
                }
            }
        }
    }
}

#Preview {
    OperableView()
}
