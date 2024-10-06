//
//  test.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/4/24.
//

import SwiftUI

struct TestView2: View {
    @Binding var exercise: Exercise
    @State private var showNumberPicker = false
    let weightRange = Array(0...400)
    
    var body: some View {
        HStack(spacing: 10) {
            Button("Choose a Number") {
                showNumberPicker.toggle()
            }
            .popover(isPresented: $showNumberPicker) {
//                Text("hi")
//                    .presentationCompactAdaptation(.popover)
                Picker(selection: $exercise.weight, label: Text("Weight")) {
                    ForEach(weightRange, id: \.self) { second in
                        Text("\(second) s").tag(second)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                .clipped()
                .presentationCompactAdaptation(.popover)
                        }
        }
    }
}
struct ParentView3: View {
    @State private var exercise: Exercise = Exercise()

    var body: some View {
        VStack {
            TestView2(exercise: $exercise)
        }
        .padding()
    }
}

struct SwiftUIExerciseInputView_Previews3: PreviewProvider {
    static var previews: some View {
        ParentView3()
    }
}

