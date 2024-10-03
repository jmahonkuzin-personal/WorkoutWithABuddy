//
//  PrettySymbolView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/2/24.
//

import SwiftUI

struct PrettySymbolView: View {
    
    @State private var timeRemaining: Double = 10 // Set the countdown timer duration here (in seconds)
    @State private var isActive = false
    let totalTime: Double = 10 // The total countdown time
    @State private var timer: Timer?
    
    var body: some View {
        let ring1Color: Color = .orange
        let ring2Color: Color = .yellow
        let lineWidth: CGFloat = 40
        let scale: CGFloat = 0.7
        
        VStack {
            Circle()
                .scale(scale)
                .stroke(lineWidth: lineWidth)
                .foregroundColor(ring1Color)
                .offset(x: -lineWidth/2)
                .overlay(Circle()
                    .scale(scale)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(ring2Color)
                    .offset(x: lineWidth/2))
                .overlay(Circle()
                    .trim(from: 0.5, to: 1)
                    .scale(scale)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(ring1Color)
                    .offset(x: -lineWidth/2))
                .phaseAnimator([false, true]) { sign, s2 in
                    Circle()
                        .scale(scale)
                        .stroke(lineWidth: lineWidth)
                        .trim(from: 0.0, to: s2 ? 0.0 : 10.0)
                        .rotationEffect(Angle(degrees: 270.0))
                } animation: { s2 in
                        .easeInOut(duration: 4).repeatForever(autoreverses: true)
                }
            
            Button(action: {
                startTimer()
            }) {
                Text("Start")
            }
            Spacer()
                .frame(height: 200)
        }
    }
    
    func startTimer() {
        isActive = true
        timer = Timer(timeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
            }
        }
        if let timer = timer {
            RunLoop.current.add(timer, forMode: .common)
        }
    }
    func stopTimer() {
        isActive = false
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    PrettySymbolView()
}
