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
    @State private var showExitPopup = false
    let totalTime: Double = 20 // The total countdown time
    @State private var timer: Timer?
    @State private var userInput: String = "" // State variable to store user input
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                    .background(Color.gray)
                    .frame(height: 1)
                
                Text("Push ups")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.top, 10)
                
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
                
                TimerView(timeRemaining: $timeRemaining, totalTime: totalTime)
                
            }.toolbar {
                BottomToolbar()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .padding()
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

struct BottomToolbar: ToolbarContent {
    @State private var isCancelSelected: Bool = false
    @State private var isPauseSelected: Bool = false
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button(action: {
                isCancelSelected = true
            }) {
                Image(systemName: "x.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.red)
            }
            .buttonStyle(PlainButtonStyle())
        }
        
        ToolbarItem(placement: .destructiveAction) {
            Button(action: {
                isPauseSelected = true
            }) {
                Image(systemName: "pause.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.yellow)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CircularRunLoopTimerView()
    }
}
