//
//  DayOfWeekView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation
import SwiftUI

// The view that holds the day name and icon
struct DayOfWeekView: View {
    var day: WorkoutDay
    var boxWidth: CGFloat
    
    @ObservedObject var selectedDayManager: SelectedDayManager
    @ObservedObject var workoutManager: WorkoutManager
    
    // Day name in a rectangle above
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(day == selectedDayManager.selectedDay ? Color.blue.opacity(0.4) : Color.gray.opacity(0.2))
                .frame(width: boxWidth, height: 30)
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
            WorkoutTypeView(dayOfWeek: day.dayOfWeek, workoutManager: workoutManager)
            .frame(width: boxWidth, height: 115)
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
