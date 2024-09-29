//
//  TimePickerView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/25/24.
//

import SwiftUI

struct TimePickerView: View {
    @State private var hours = 0
    @State private var minutes = 0
    @State private var seconds = 0
    
    let hoursRange = Array(0...99)
    let minutesRange = Array(0...59)
    let secondsRange = Array(0...59)
    
    var body: some View {
        VStack {
            Text("Input Time")
                .font(.largeTitle)
                .padding()

            // Display the selected time in 00:00:00 format
            Text("\(formattedTime())")
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .padding()
            
            HStack(spacing: 20) {
                // Hours Picker
                Picker(selection: $hours, label: Text("Hours")) {
                    ForEach(hoursRange, id: \.self) { hour in
                        Text("\(hour) h").tag(hour)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                .clipped()
                
                // Minutes Picker
                Picker(selection: $minutes, label: Text("Minutes")) {
                    ForEach(minutesRange, id: \.self) { minute in
                        Text("\(minute) m").tag(minute)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                .clipped()
                
                // Seconds Picker
                Picker(selection: $seconds, label: Text("Seconds")) {
                    ForEach(secondsRange, id: \.self) { second in
                        Text("\(second) s").tag(second)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                .clipped()
            }
            .padding()
        }
        .padding()
    }
    
    // Helper function to format the time as 00:00:00
    private func formattedTime() -> String {
        let formattedHours = String(format: "%02d", hours)
        let formattedMinutes = String(format: "%02d", minutes)
        let formattedSeconds = String(format: "%02d", seconds)
        return "\(formattedHours):\(formattedMinutes):\(formattedSeconds)"
    }
}




#Preview {
    TimePickerView()
}
