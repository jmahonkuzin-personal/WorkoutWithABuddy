//
//  DayOfWeekView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation
import SwiftUI
// ObservableObject to manage the selected day
class SelectedDayManager: ObservableObject {
    @Published var selectedDay: WorkoutDay? = nil
}

// The view that holds the day name and icon
struct WeekView: View {
    var day: WorkoutDay
    var boxWidth: CGFloat
    
    @ObservedObject var selectedDayManager: SelectedDayManager
    @ObservedObject var workoutManager: WorkoutManager
    
    // Day name in a rectangle above
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(day == selectedDayManager.selectedDay ? Color.blue.opacity(0.4) : Color.gray.opacity(0.2))
                .frame(width: boxWidth, height: 40)
                .overlay(
                    Text(day.dayOfWeek)
                    .font(.caption)
                    .fontWeight(.bold)
                )
                .onTapGesture {
                    // Toggle selection
                    if selectedDayManager.selectedDay == day {
                        selectedDayManager.selectedDay = nil // Deselect if tapped again
                    } else {
                        selectedDayManager.selectedDay = day // Select the day
                    }
                }
            VStack {
                let currentWorkoutForSelectedDay = workoutManager.workout(forDay: day.dayOfWeek)
                if (currentWorkoutForSelectedDay != nil) {
                    let currentIcon = currentWorkoutForSelectedDay?.workout?.icon
                    Image(systemName: currentIcon ?? "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.pink)
                }
            }
            .frame(width: boxWidth, height: 160)
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(day == selectedDayManager.selectedDay ? Color.blue.opacity(0.4) : Color.gray.opacity(0.2))
            )
            .onTapGesture {
                // Toggle selection
                if selectedDayManager.selectedDay == day {
                    selectedDayManager.selectedDay = nil // Deselect if tapped again
                } else {
                    selectedDayManager.selectedDay = day // Select the day
                }
            }
        }
    }
}
