//
//  VisualPresentationView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct VisualPresentationView: View {
    @State var showBackgroundButton = false
    @State var vSpacing: CGFloat = 0
    @State var colorComponent: CGFloat = 0.8
    @State var buttonColorComponent: CGFloat = 0.8
    @State var buttonSelected = false

    var body: some View {
        ZStack {
            Color.init(red: colorComponent, green: colorComponent, blue: colorComponent)
                .ignoresSafeArea()
            GuidelineView {
                VStack {
                    HStack {
                        Image("canteros")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 64, height: 64)
                        Spacer()
                        if showBackgroundButton {
                            Button {
                                buttonSelected.toggle()
                                colorComponent = buttonSelected ? 1.0 : 0.2
                            } label: {
                                Text("Alternar fondo")
                                    .foregroundStyle(buttonSelected ? .white : .blue)
                            }
                            .padding(12)
                            .background(buttonSelected ? .blue : .white)
                            .clipShape(Capsule())
                        }
                        Spacer()
                        Image("canteros")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 64, height: 64)
                    }
                    ZStack() {
                        Text("""
                ¿Quién controla a los británicos?
                ¿Quién bloquea el sistema métrico?
                Nosotros, nosotros.
                """
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        Text("""
                ¿Quién deja Atlantis fuera del mapa?
                ¿Quién esconde a los Marcianos?
                Nosotros, nosotros.
                """
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .transformEffect(.init(translationX: 0, y: 64 + vSpacing))
                        Text("""
                ¿Quién no enseña los coches eléctricos?
                ¿Quién convierte a Steve Guttenberg en una estrella?
                Nosotros, nosotros.
                """
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .transformEffect(.init(translationX: 0, y: 140 + 2*vSpacing))
                        Text("""
                ¿Quién le quita la vista al pez ciego?
                ¿Quién amaña todas las galas de los Oscar?
                Nosotros, nosotros
                """
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .transformEffect(.init(translationX: 0, y: 218 + 3*vSpacing))
                    }
                    Spacer()
                }
                .padding()
            } onAccessibilityStatusChange: { accessibilityStatus in
                switch accessibilityStatus {
                case .default:
                    withAnimation {
                        colorComponent = 0.8
                        vSpacing = 0
                        showBackgroundButton = false
                    }
                case .reality:
                    withAnimation {
                        colorComponent = 0.3
                        vSpacing = -10
                        showBackgroundButton = false
                    }
                case .accessible:
                    withAnimation {
                        colorComponent = buttonSelected ? 1.0 : 0.3
                        vSpacing = 30
                        showBackgroundButton = true
                    }
                }
            }
        }
    }
}

#Preview {
    VisualPresentationView()
}
