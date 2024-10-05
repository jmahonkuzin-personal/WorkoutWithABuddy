//
//  WorkoutTypeView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import Foundation

import Foundation
import SwiftUI

// The view that holds the day name and icon
struct WorkoutTypeView: View {
    var dayOfWeek: String
    
    @ObservedObject var workoutManager: WorkoutManager
    
    // Day name in a rectangle above
    var body: some View {
        VStack {
            let currentWorkoutForSelectedDay = workoutManager.getWorkout(forDay: dayOfWeek)
            let icon = currentWorkoutForSelectedDay.icon
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.pink)
            Text(currentWorkoutForSelectedDay.id)
        }
    }
}
