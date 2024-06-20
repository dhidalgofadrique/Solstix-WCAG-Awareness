//
//  ResizeTextView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct ResizeTextView: View {
    @State var fontType: Font = .body

    var body: some View {
        GuidelineView {
            VStack {
                Image("solfamidas")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("""
                    Cómo me mola el cartel "Bebé a bordo"
                    En el cristal de mi coche
                    Quiero viajar con mi bebé
                    Ya no puedo ir en el coche sin él
                    Bebé a bordo, dice el cartel.
                    Ya no puedo ir en el coche sin él
                    y es que está francamente bien es un viaje hacia el Edén
                    si está a bordo mi bebé.
                    """
                )
                .font(fontType)
                .padding()
                Spacer()
            }
        } onAccessibilityStatusChange: { accessibilityStatus in
            switch accessibilityStatus {
            case .default:
                withAnimation {
                    fontType = .headline
                }
            case .reality:
                withAnimation {
                    fontType = .system(size: 10)
                }
            case .accessible:
                withAnimation {
                    fontType = .caption2
                }
            }
        }
    }
}

#Preview {
    ResizeTextView()
}
