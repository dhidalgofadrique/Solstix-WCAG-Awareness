//
//  OrientationView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct OrientationView: View {
    @State var rotationEnabled = false
    @State var rotation: Double = 0

    var body: some View {
        GuidelineView(content: {
            VStack {
                Image("monorail")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("""
                - ¿Qué he dicho?
                + Monorail
                - ¿Cómo se llama?
                + ¡Monorail!
                - ¡Eso es!
                """)
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .rotationEffect(.degrees(rotation))
            .onRotate { newOrientation in
                switch newOrientation {
                case .portrait:
                    rotation = rotationEnabled ? 0 : 0
                case .portraitUpsideDown:
                    rotation = rotationEnabled ? 0 : 180
                case .landscapeLeft:
                    rotation = rotationEnabled ? 0 : 90
                case .landscapeRight:
                    rotation = rotationEnabled ? 0 : -90
                default:
                    print("Do nothing")
                }
            }
            .padding()
        } ,showRealityButton: false, onAccessibilityStatusChange: { accessibilityStatus in
            switch accessibilityStatus {
            case .default:
                rotationEnabled = false
            case .reality:
                rotationEnabled = false
            case .accessible:
                rotationEnabled = true
            }
        }
        )
    }
}

#Preview {
    OrientationView()
}

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
