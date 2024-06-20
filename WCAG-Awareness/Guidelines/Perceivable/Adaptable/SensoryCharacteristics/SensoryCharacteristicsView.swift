//
//  SensoryCharacteristicsView.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

struct User: Identifiable {
    let id: UUID
    let name: String
    let isConnected: Bool

    init(name: String, isConnected: Bool) {
        id = UUID()
        self.name = name
        self.isConnected = isConnected
    }
}

struct SensoryCharacteristicsView: View {
    private let users: [User] = [
        .init(name: "Homer Simpson", isConnected: false),
        .init(name: "Marge Simpson", isConnected: true),
        .init(name: "Bart Simpson", isConnected: true),
        .init(name: "Lisa Simpson", isConnected: false),
        .init(name: "Maggie Simpson", isConnected: true),
        .init(name: "Barney Gumble", isConnected: false),
    ]

    @State var showRealColors = true
    @State var showCaption = false

    var body: some View {
        GuidelineView {
            VStack {
                Text("Usuarios conectados")
                    .font(.title)
                List {
                    ForEach(users) {
                        ConnectedUserView(
                            user: $0,
                            showRealColors: showRealColors,
                            showCaption: showCaption
                        )
                    }
                }
            }
        } onAccessibilityStatusChange: { accessibilityStatus in
            switch accessibilityStatus {
            case .default:
                withAnimation {
                    showRealColors = true
                    showCaption = false
                }
            case .reality:
                withAnimation {
                    showRealColors = false
                    showCaption = false
                }
            case .accessible:
                withAnimation {
                    showRealColors = false
                    showCaption = true
                }
            }
        }
        .padding()
    }
}

struct ConnectedUserView: View {
    let user: User
    let showRealColors: Bool
    let showCaption: Bool

    var body: some View {
        HStack {
            Text(user.name)
                .font(.body)
            Spacer()
            Text(text(for: user, showCaption: showCaption))
                .frame(minWidth: 20)
                .padding(4)
                .background(color(for: user, showRealColors: showRealColors))
                .clipShape(Capsule())
        }
        .padding()
    }

    private func color(for user: User, showRealColors: Bool) -> Color {
        if showRealColors {
            return user.isConnected ? .green : .red
        } else {
            return user.isConnected ? Color(red: 0.8, green: 0.8, blue: 0.8) : Color(red: 0.7, green: 0.7, blue: 0.7)
        }
    }

    private func text(for user: User, showCaption: Bool) -> String {
        if showCaption {
            return user.isConnected ? "online" : "offline"
        } else {
            return " "
        }
    }
}

#Preview {
    SensoryCharacteristicsView()
}
