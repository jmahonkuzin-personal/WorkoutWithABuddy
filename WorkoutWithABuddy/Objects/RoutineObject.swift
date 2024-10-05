//
//  RoutineObject.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/4/24.
//

import Foundation

struct RoutineObject: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    var name: String
    var description: String
}
