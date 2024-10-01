//
//  WorkoutTypes.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation
import SwiftUI

enum WorkoutType: String, CaseIterable, Identifiable {
    case core = "Core"
    case push = "Push"
    case pull = "Pull"
    case walk = "Walk"
    case run = "Run"
    case stretch = "Stretch"
    case rest = "Rest"
    
    var id: String { self.rawValue }
    
    // Computed property to map enum to string
    var icon: String {
        switch self {
        case .core:
            return "figure.core.training"
        case .push:
            return "figure.strengthtraining.traditional"
        case .pull:
            return "figure.play"
        case .walk:
            return "figure.walk"
        case .run:
            return "figure.run"
        case .stretch:
            return "figure.flexibility"
        case .rest:
            return "figure.stand"
        }
    }
    
    var color: Color {
        switch self {
        case .core:
            return .cyan
        case .push:
            return .brown
        case .pull:
            return .pink
        case .walk:
            return .mint
        case .run:
            return .orange
        case .stretch:
            return .yellow
        case .rest:
            return .blue
        }
    }
}
