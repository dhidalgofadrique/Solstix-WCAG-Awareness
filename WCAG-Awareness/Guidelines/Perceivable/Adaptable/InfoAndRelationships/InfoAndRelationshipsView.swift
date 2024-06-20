//
//  InfoAndRelationshipsView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct InfoAndRelationshipsView: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var company: String = ""
    @State private var position: String = ""
    @State private var additionalInfo: String = ""

    @State var showAccessibilityInfo = false

    @State private var sendResult: String = ""

    var body: some View {
        GuidelineView(content: {
            VStack {
                Form {
                    Section("Datos personales") {
                        VStack {
                            if showAccessibilityInfo {
                                Text("Nombre* (Obligatorio)")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            TextField("Nombre", text: $name)
                        }
                        VStack {
                            if showAccessibilityInfo {
                                Text("Apellidos")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            TextField("Apellidos", text: $surname)
                        }
                    }
                    Section("Datos profesionales") {
                        VStack {
                            if showAccessibilityInfo {
                                Text("Empresa* (Obligatorio)")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            TextField("Empresa", text: $company)
                        }
                        VStack {
                            if showAccessibilityInfo {
                                Text("Puesto")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            TextField("Puesto", text: $position)
                        }
                    }
                    Section("Información adicional") {
                        VStack {
                            if showAccessibilityInfo {
                                Text("Otros datos de interés")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            TextField("Otros datos de interés", text: $additionalInfo)
                        }
                    }
                }
                Spacer()
                VStack {
                    Text(sendResult)
                    Button("Enviar") {
                        if name.isEmpty {
                            sendResult = "❌ El nombre es obligatorio"
                        } else if company.isEmpty {
                            sendResult = "❌ La empresa es obligatoria"
                        } else {
                            sendResult = "✅ Datos enviados correctamente"
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())                }
                .padding(.horizontal)
            }
        } ,showRealityButton: false, onAccessibilityStatusChange: { accessibilityStatus in
            sendResult = ""
            switch accessibilityStatus {
            case .default:
                withAnimation {
                    showAccessibilityInfo = false
                }
            case .reality:
                withAnimation {
                    showAccessibilityInfo = false
                }
            case .accessible:
                withAnimation {
                    showAccessibilityInfo = true
                }
            }
        }
        )
    }
}

#Preview {
    InfoAndRelationshipsView()
}
