//
//  WeekViewWithRoutineTypeView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/5/24.
//

import SwiftUI

struct WeekViewWithRoutineTypeView: View {
    @ObservedObject var routineManager: WeeklyRoutineManager
    var routines: [String: WorkoutRoutineType]
    
    init(routineManager: WeeklyRoutineManager) {
        self.routineManager = routineManager
        self.routines = routineManager.routines
    }
    
    var body: some View {
        let allKeys = Array(routineManager.routines.keys)
        HStack(alignment: .top, spacing: 4) {
            ForEach(Array(routines.keys), id: \.self) { day in
                
                VStack {
//                    RoundedRectangle(cornerRadius: 2)
//                        .fill(day.key == selectedDay ? Color.blue.opacity(0.4) : Color.gray.opacity(0.2))
//                        .frame(height: 30)
//                        .overlay(
//                            Text(day.key)
//                                .font(.system(size:20))
//                                .fontWeight(.bold)
//                        )
//                        .onTapGesture {
//                            tapGesture(day.key)
//                        }
                    
                    RoundedRectangle(cornerRadius: 2)
                        .fill(day == routineManager.selectedDay ? Color.blue.opacity(0.4) : Color.gray.opacity(0.2))
                        .frame(height: 115)
//                        .overlay(
//                            WorkoutTypeView(dayOfWeek: day, routineManager: routineManager)
//                        )
//                        .onTapGesture {
//                            tapGesture(day)
//                        }
                }
            }
        }
    }
    
    mutating func tapGesture(_ day: String) {
        // Toggle selection
        if routineManager.selectedDay == day {
            routineManager.updateSelectedDay(to: nil)
        } else {
            routineManager.updateSelectedDay(to: day)
        }
    }
}
