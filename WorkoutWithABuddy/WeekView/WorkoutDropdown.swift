//
//  WorkoutDropdown.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import SwiftUI

struct WorkoutDropdownView: View {
    var selectedDay: WorkoutDay // see if you need @State modifier
    
    // Use the WorkoutManager to manage the list of workouts
    @StateObject var workoutManager = WorkoutManager()
    
    @State var selectedWorkoutType: WorkoutType? = nil
    
    // Custom initializer without parameter labels
    init(_ selectedDay: WorkoutDay) {
        self.selectedDay = selectedDay
    }
    
    var body: some View {
        VStack {
            Text(selectedDay.dayOfWeek)
            
            let dayOfWeek = selectedDay.dayOfWeek
//            let wd = workoutManager.workout(forDay: dayOfWeek)
            
//            Text(workoutDay?.workout?.icon ?? "icon")
            // ok need to fix this dropdown!
            let workoutList = PossibleWorkouts.workouts
            Picker("Select Icon", selection: Binding(
                get: {
                    workoutManager.workout(forDay: dayOfWeek)
//                    workoutDay?.workout ?? WorkoutType(name: "Core", icon: "figure.core.training") // fix this default later
                },
                set: { newWorkoutType in
                    workoutManager.updateWorkout(forDay: dayOfWeek, withWorkout: newWorkoutType)
                }
            )) {
                ForEach(workoutList, id: \.self) { workout in
                    HStack {
                        Image(systemName: workout.icon)
                        Text(workout.name)
                    }
                    .tag(workout) // Attach a tag to each picker option
                }
            }
            .pickerStyle(MenuPickerStyle()) // Picker style as dropdown menu
            .padding()
            .frame(width: 200, height: 40)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            
            Spacer()
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let workoutDay = WorkoutDay(dayOfWeek: "Monday", workout: WorkoutType(name: "Core", icon: "figure.core.training"))
        WorkoutDropdownView(workoutDay)
    }
}
