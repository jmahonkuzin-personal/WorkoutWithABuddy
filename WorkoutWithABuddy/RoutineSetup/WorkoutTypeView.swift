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
    var day: String
    
    @ObservedObject var manager: WeeklyRoutineManager
    
    // Day name in a rectangle above
    var body: some View {
        VStack {
            let curWorkoutRoutine = manager.routines[day] ?? WorkoutRoutineType.rest
            let icon = curWorkoutRoutine.icon
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.pink)
            Text(curWorkoutRoutine.id)
        }
    }
}
