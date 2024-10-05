//
//  SwiftUIView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI

struct SwiftUIExerciseInputView: View {
    @Binding var exercise: Exercise
    let weightRange = Array(0...400)
    let repsPerSetRange = Array(0...30)
    let setsRange = Array(0...20)
    

    @State private var showNumberPicker = false
    @State private var selectedNumber = 0
    
    var body: some View {
        VStack {
            TextField("Exercise name", text: $exercise.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Choose a Number") {
                showNumberPicker.toggle()
            }
            .padding()
            .sheet(isPresented: $showNumberPicker) {
                NumberPickerPopup(selectedNumber: $selectedNumber)
            }
            
            Stepper("\(exercise.weight) hours", value: $exercise.weight)

            
            HStack {
                NumInputView()
                Picker(selection: $exercise.weight, label: Text("Weight")) {
                    ForEach(weightRange, id: \.self) { second in
                        Text("\(second) s").tag(second)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                .clipped()
                
                
//                TextField("Weight", text: $exercise.weight)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
                WeightUnitPickerView(selectedWeightUnit: $exercise.weightUnit)
            }
            HStack {
                
                Picker(selection: $exercise.repsPerSet, label: Text("Reps per set")) {
                    ForEach(repsPerSetRange, id: \.self) { second in
                        Text("\(second) s").tag(second)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                .clipped()
                
                Picker(selection: $exercise.sets, label: Text("Sets")) {
                    ForEach(setsRange, id: \.self) { second in
                        Text("\(second) s").tag(second)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 80)
                .clipped()
                
//                TextField("Number of reps", text: $exercise.repsPerSet)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                TextField("Number of sets", text: $exercise.sets)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }

    
    struct NumberPickerPopup: View {
        @Binding var selectedNumber: Int
        @Environment(\.presentationMode) var presentationMode
        let numbers = Array(0...100)  // Numbers from 0 to 100

        var body: some View {
            NavigationView {
                VStack {
                    Picker("Select a number", selection: $selectedNumber) {
                        ForEach(numbers, id: \.self) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .labelsHidden()

                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                }
                .navigationTitle("Choose Number")
            }
        }
    }
}

struct ParentView: View {
    @State private var exercise: Exercise = Exercise()

    var body: some View {
        VStack {
            SwiftUIExerciseInputView(exercise: $exercise)
        }
        .padding()
    }
}

struct SwiftUIExerciseInputView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
