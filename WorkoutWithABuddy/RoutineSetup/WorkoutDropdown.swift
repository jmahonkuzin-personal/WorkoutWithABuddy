//
//  RoutineDropdownView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import SwiftUI

struct RoutineDropdownView: View {
    @ObservedObject var weeklyRoutineManager: WeeklyRoutineManager
    var day: String
    @State private var selectedRoutine: WorkoutRoutineType
    
    init(manager: WeeklyRoutineManager) {
        self.weeklyRoutineManager = manager
        self.day = manager.selectedDay ?? ""
        _selectedRoutine = State(initialValue: manager.routines[day] ?? WorkoutRoutineType.rest)
    }
    
    var body: some View {
        Picker("Select an option", selection: $selectedRoutine) {
            ForEach(WorkoutRoutineType.allCases) { type in
                Text(type.rawValue)
            }
        }
        .pickerStyle(.menu)
        .onChange(of: selectedRoutine) { newValue, oldValue in
            weeklyRoutineManager.updateRoutine(for: day, with: newValue)
        }
    }
}
