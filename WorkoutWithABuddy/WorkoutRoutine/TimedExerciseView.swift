//
//  TimedExerciseView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/2/24.
//
import SwiftUI

struct CircularRunLoopTimerView: View {
    @State private var timeRemaining: Double = 20 // Set the countdown timer duration here (in seconds)
    @State private var isActive = false
    let totalTime: Double = 20 // The total countdown time
    @State private var timer: Timer?
    
    var body: some View {
        
        VStack {
            Spacer()
                .frame(height: 70)
            Text("Push ups")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

            HStack {
                Button(action: {
                    toggleTimer()
                }) {
                    Text(isActive ? "Pause" : "Start")
                        .font(.title)
                        .padding()
                        .background(isActive ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    // figure out how to make the button be the same size with different size texts
                }
                
                Button(action: {
                    resetTimer()
                }) {
                    Text("Reset")
                        .font(.title)
                        .padding()
                        .background(.gray)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        
                }
                .disabled(timeRemaining == totalTime)
                .opacity(timeRemaining == totalTime ? 0.5 : 1.0) // Make button look disabled (dimmed when inactive)
            }
            let underRingColor: Color = .gray
//            let ring2Color: Color = .yellow
            let lineWidth: CGFloat = 40
            let scale: CGFloat = 0.7
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
            Spacer()
                .frame(height: 70)
            
            Text("> Next up, lemon squeezers")
                .font(.title3)
            Spacer()
                .frame(height: 40)
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
    
    func toggleTimer() {
        if isActive {
            stopTimer()
        } else {
            startTimer()
        }
    }
    
    func resetTimer() {
        timeRemaining = totalTime
        self.stopTimer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CircularRunLoopTimerView()
    }
}
