//
//  TimerView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/4/24.
//

import SwiftUI

struct TimerView: View {
    @Binding var timeRemaining: Double
    var totalTime: Double
    
    var body: some View {
        let underRingColor: Color = .gray
        let lineWidth: CGFloat = 28
        let scale: CGFloat = 0.8
        let fraction = CGFloat(timeRemaining / totalTime)
        ZStack {
            Text("\(Int(timeRemaining))s")
                .font(.largeTitle)
                .bold()
            Circle()
                .scale(scale)
                .stroke(lineWidth: lineWidth)
                .foregroundColor(underRingColor)
                .overlay(Circle()
                    .trim(from: 0.0, to: fraction)
                    .scale(scale)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(fraction > 0.75 ? .blue :
                                        fraction > 0.5 ? .yellow :
                                        fraction > 0.25 ? .orange : .red)
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(.bouncy, value: fraction)
                )
        }
    }
}

//#Preview {
//    TimerView(
//    timeRemaining: <#T##Binding<Double>#>, totalTime: <#T##Double#>)
//}
