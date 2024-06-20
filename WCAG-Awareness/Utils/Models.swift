//
//  Models.swift
//  WCAG-Awareness
//
//  Created by David Hidalgo Fadrique on 20/6/24.
//

import SwiftUI

enum AccessibilityStatus {
    case `default`
    case reality
    case accessible
}

enum AccessibilityLevel: String {
    case A
    case AA
    case AAA

    var color: Color {
        switch self {
        case .A, .AA:
            return .green
        case .AAA:
            return .green
        }
    }
}
