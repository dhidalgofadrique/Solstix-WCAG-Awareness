//
//  IdentifyInputPurposeView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

enum Field: Int, Hashable {
    case name
    case surname
    case email
    case phone
    case address
}

struct IdentifyInputPurposeView: View {
    @FocusState private var focusedField: Field?

    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""

    @State var showAccessibilityInfo = false

    var body: some View {
        GuidelineView(content: {
            VStack {
                Form {
                    Section("Datos personales") {
                        VStack {
                            TextField("Nombre", text: $name)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .name)
                                .onSubmit { focusedField = .surname }
                                .if(showAccessibilityInfo) { textfield in
                                    textfield.textContentType(.givenName)
                                }
                        }
                        VStack {
                            TextField("Apellidos", text: $surname)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .surname)
                                .onSubmit { focusedField = .email }
                                .if(showAccessibilityInfo) { textfield in
                                    textfield.textContentType(.familyName)
                                }
                        }
                        VStack {
                            TextField("Email", text: $email)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .email)
                                .onSubmit { focusedField = .phone }
                                .if(showAccessibilityInfo) { textfield in
                                    textfield.textContentType(.emailAddress)
                                }
                        }
                        VStack {
                            TextField("Teléfono", text: $phone)
                                .submitLabel(.next)
                                .focused($focusedField, equals: .phone)
                                .onSubmit { focusedField = .address }
                                .if(showAccessibilityInfo) { textfield in
                                    textfield.textContentType(.telephoneNumber)
                                }
                        }
                        VStack {
                            TextField("Dirección", text: $address)
                                .submitLabel(.done)
                                .focused($focusedField, equals: .address)
                                .onSubmit { focusedField = nil }
                                .if(showAccessibilityInfo) { textfield in
                                    textfield.textContentType(.fullStreetAddress)
                                }
                        }
                    }
                }
                .onTapGesture {
                    focusedField = nil
                }
            }
        } ,showRealityButton: false, onAccessibilityStatusChange: { accessibilityStatus in
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
    IdentifyInputPurposeView()
}
