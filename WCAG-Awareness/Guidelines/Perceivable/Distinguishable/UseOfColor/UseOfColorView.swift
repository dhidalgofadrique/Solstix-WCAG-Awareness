//
//  UseOfColorView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct UseOfColorView: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""

    @State var applyStyle = true
    @State var showMandatoryImage = false

    var body: some View {
        GuidelineView {
            VStack {
                Form {
                    Section("Datos personales") {
                        VStack {
                            HStack(spacing: 4) {
                                Text("Nombre")
                                    .foregroundStyle(applyStyle ? .red : .black)
                                if showMandatoryImage {
                                    Image("mandatory")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                Spacer()
                            }
                            TextField("", text: $name)
                        }
                        VStack {
                            Text("Apellidos")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("", text: $surname)
                        }
                        VStack {
                            HStack(spacing: 4) {
                                Text("Email")
                                    .foregroundStyle(applyStyle ? .red : .black)
                                if showMandatoryImage {
                                    Image("mandatory")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                Spacer()
                            }
                            TextField("", text: $email)
                        }
                        VStack {
                            Text("Teléfono")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("", text: $phone)
                        }
                        VStack {
                            Text("Dirección")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("", text: $address)
                        }
                    }
                }
            }
        } onAccessibilityStatusChange: { accessibilityStatus in
            switch accessibilityStatus {
            case .default:
                withAnimation {
                    applyStyle = true
                    showMandatoryImage = false
                }
            case .reality:
                withAnimation {
                    applyStyle = false
                    showMandatoryImage = false
                }
            case .accessible:
                withAnimation {
                    applyStyle = false
                    showMandatoryImage = true
                }
            }
        }
    }
}

#Preview {
    UseOfColorView()
}
