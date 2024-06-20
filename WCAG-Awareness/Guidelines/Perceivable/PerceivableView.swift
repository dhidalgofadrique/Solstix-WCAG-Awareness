//
//  PerceivableView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct PerceivableView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Perceptible")
                    .font(.largeTitle)
                List {
                    Section {
                        GuidelineCell(
                            title: "1.1.1 Non-text Content",
                            accessibilityLevel: .A
                        ) {
                            NonTextContentView()
                        }
                    } header: {
                        Text("1.1 Text Alternatives")
                    }
                    Section {
                        GuidelineCell(
                            title: "1.2.1 Audio-only and Video-only (Prerecorded)",
                            accessibilityLevel: .A
                        ) {
                            Text("Pending")
                        }
                        GuidelineCell(
                            title: "1.2.2 Captions (Prerecorded)",
                            accessibilityLevel: .A
                        ) {
                            Text("Pending")
                        }
                        GuidelineCell(
                            title: "1.2.6 Sign Language (Prerecorded)",
                            accessibilityLevel: .AA
                        ) {
                            Text("Pending")
                        }
                        GuidelineCell(
                            title: "1.2.9 Audio-only (Live)",
                            accessibilityLevel: .AAA
                        ) {
                            Text("Pending")
                        }
                    } header: {
                        Text("Time-based Media")
                    }
                    Section {
                        GuidelineCell(
                            title: "1.3.1 Info and Relationships",
                            accessibilityLevel: .A
                        ) {
                            InfoAndRelationshipsView()
                        }
                        GuidelineCell(
                            title: "1.3.3 Sensory Characteristics",
                            accessibilityLevel: .A
                        ) {
                            SensoryCharacteristicsView()
                        }
                        GuidelineCell(
                            title: "1.3.4 Orientation",
                            accessibilityLevel: .AA
                        ) {
                            OrientationView()
                        }
                        GuidelineCell(
                            title: "1.3.5 Identify Input Purpose",
                            accessibilityLevel: .AA
                        ) {
                            IdentifyInputPurposeView()
                        }
                    } header: {
                        Text("1.3 Adaptable")
                    }
                    Section {
                        GuidelineCell(
                            title: "1.4.2 Audio Control",
                            accessibilityLevel: .A
                        ) {
                            AudioControlView()
                        }
                        GuidelineCell(
                            title: "1.4.3 Contrast (minimum)",
                            accessibilityLevel: .AA
                        ) {
                            MinimumContrastView()
                        }
                        GuidelineCell(
                            title: "1.4.4 Resize Text",
                            accessibilityLevel: .AA
                        ) {
                            ResizeTextView()
                        }
                        GuidelineCell(
                            title: "1.4.8 Visual Presentation",
                            accessibilityLevel: .AAA
                        ) {
                            VisualPresentationView()
                        }
                    } header: {
                        Text("1.4 Distinguishable")
                    }
                }
            }
        }
    }
}

#Preview {
    PerceivableView()
}
