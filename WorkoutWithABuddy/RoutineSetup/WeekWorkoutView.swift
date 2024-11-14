//
//  WeekWorkoutView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import SwiftUI

struct WeekWorkoutView: View {
    @StateObject var weeklyRoutineManager = WeeklyRoutineManager()
    
    var body: some View {
        NavigationView {
            VStack {
                // Spacer to push the content towards the center
                Spacer()
                    .frame(height: 70)
                
                // Text above the week view, centered in the middle of the screen
                Text("Your Weekly Workouts")
                    .font(.title)
                    .fontWeight(.bold)
                
                WeekViewWithRoutineTypeView(routineManager: weeklyRoutineManager)
                
                let routines = weeklyRoutineManager.routines
                
                // Text displaying the selected day
                if let testForNil = weeklyRoutineManager.selectedDay {
                    let selectedRoutineType = routines[testForNil] ?? WorkoutRoutineType.rest

                    RoutineDropdownView(manager: weeklyRoutineManager)
                    
                    if selectedRoutineType != WorkoutRoutineType.rest {
                        NavigationLink(destination: AddDetailsView(
                            workoutType: selectedRoutineType
                        )
                            .navigationBarBackButtonHidden(true)
                        ) {
                            Text("Add exercises to your \(selectedRoutineType.id) day")
                                .foregroundColor(.blue)
                                .padding(.top, 5)
                        }
                        .navigationBarBackButtonHidden(true)
                    }
                } else {
                    Text("Select a day")
                        .font(.system(size:30))
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
                Spacer()
            }
        }
    }
}

struct WeekWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WeekWorkoutView()
    }
}
