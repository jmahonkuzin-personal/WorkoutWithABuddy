//
//  WeekWorkoutView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import SwiftUI

struct WeekWorkoutView: View {
    let weekWorkout = WeekWorkout()
        
    @StateObject var selectedDayManager = SelectedDayManager()
    
    var body: some View {
        VStack {
            // Spacer to push the content towards the center
            Spacer()
                .frame(height: 100)
            
            // Text above the week view, centered in the middle of the screen
            Text("Your Weekly Workout")
                .font(.title)
                .fontWeight(.bold)
            
            GeometryReader { geometry in
                let screenWidth = geometry.size.width
                let boxWidth = screenWidth / CGFloat(weekWorkout.days.count) - 10 // Subtract for padding/margins
                
                HStack(alignment: .top, spacing: 4) {
                    ForEach(weekWorkout.days) { workoutDay in
                        WeekView(day: workoutDay, boxWidth: boxWidth, selectedDayManager: selectedDayManager)
                    }
                }
                .frame(maxWidth: screenWidth)
                .padding(.horizontal, (geometry.size.width - (boxWidth * CGFloat(weekWorkout.days.count) + CGFloat(10 * (weekWorkout.days.count - 1)))) / 2)
                .position(x: geometry.size.width / 2, y: 150) // Set a fixed position for the week view
            }
            .frame(height: 50) // overall height of the view
            
            Spacer()
                .frame(height: 250)// Adds space between week view and text below
            
            // Text displaying the selected day
            if let selectedDay = selectedDayManager.selectedDay {
                SelectedDayView(selectedDay)
            } else {
                Text("Select a day")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
            }
            Spacer()
        }
    }
}

struct WeekWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WeekWorkoutView()
    }
}
