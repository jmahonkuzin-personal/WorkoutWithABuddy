//
//  WeekWorkoutView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import SwiftUI

struct WeekWorkoutView: View {
    @StateObject var workoutManager = WorkoutManager()
    @StateObject var selectedDayManager = SelectedDayManager()
    
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
                
                GeometryReader { geometry in
                    let screenWidth = geometry.size.width
                    let numOfDaysInAWeek = 7
                    let boxWidth = screenWidth / CGFloat(numOfDaysInAWeek) - 10 // Subtract for padding/margins
                    
                    HStack(alignment: .top, spacing: 4) {
                        ForEach(workoutManager.workouts) { workoutDay in
                            DayOfWeekView(day: workoutDay, boxWidth: boxWidth, selectedDayManager: selectedDayManager,
                                          workoutManager: workoutManager) // maybe we don't need to send in the whole manager, but for now, lets
                        }
                    }
                    .frame(maxWidth: screenWidth)
                    .padding(.horizontal, (geometry.size.width - (boxWidth * CGFloat(numOfDaysInAWeek) + CGFloat(10 * (numOfDaysInAWeek - 1)))) / 2)
                    .position(x: geometry.size.width / 2, y: 120) // Set a fixed position for the week view
                }
                .frame(height: 40) // overall height of the view
                
                Spacer()
                    .frame(height: 180)// Adds space between week view and text below
                
                // Text displaying the selected day
                if let selectedWorkoutDay = selectedDayManager.selectedDay {
                    WorkoutDropdownView(selectedDayOfWeek: selectedWorkoutDay.dayOfWeek, workoutManager: workoutManager)
                    NavigationLink(destination: AddDetailsView()) {
                        Text("Add exercises")
                            .foregroundColor(.blue)
                            .padding(.top, 5)
                    }
                } else {
                    Text("Select a day")
                        .font(.title3)
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
