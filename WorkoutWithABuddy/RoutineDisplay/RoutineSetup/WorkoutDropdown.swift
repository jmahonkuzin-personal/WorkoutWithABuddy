//
//  WorkoutDropdown.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import SwiftUI

struct WorkoutDropdownView: View {
    var selectedDayOfWeek: String
    
    // Use the WorkoutManager to manage the list of workouts
    @ObservedObject var workoutManager: WorkoutManager
    
    var body: some View {
        VStack {
            let workoutOptions = WorkoutType.allCases
            Picker("Select workout", selection: Binding(
                get: {
                    workoutManager.getWorkout(forDay: selectedDayOfWeek)
                },
                set: {
                    selectedWorkoutType in
                    workoutManager.updateWorkout(forDay: selectedDayOfWeek, withWorkout: selectedWorkoutType)
                }
            ))
            {
                ForEach(workoutOptions) { workoutType in
                    HStack(spacing: 103) { // spacing not working
                        Image(systemName: workoutType.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 30)
                        Spacer()
                        Text(workoutType.id)
                            .padding(.leading, 30)
                    }
                    .padding(.vertical, 10)
                    .tag(workoutType)
                }
            }
            .pickerStyle(MenuPickerStyle())
//            .padding()
            .frame(width: 200, height: 40)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
        }
    }
}

struct WorkoutDropdownView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDropdownView(selectedDayOfWeek: "Monday", workoutManager: WorkoutManager())
    }
}
