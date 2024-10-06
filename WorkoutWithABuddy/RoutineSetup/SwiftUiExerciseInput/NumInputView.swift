//
//  NumInputView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/4/24.
//

import SwiftUI

struct NumInputView: View {
    @State var quantity: Int = 0
    
    // Keep track of which field the user is focused on
    @FocusState private var focusedField: String?
    
    
    
    var body: some View {
        HStack(spacing: 10) {
            TextField("", value: $quantity, formatter: NumberFormatter())
                .focused($focusedField, equals: "quantity")
                .keyboardType(.numberPad)
            
//            Stepper("Stepper", value: "", in: 0...200, step: 5, onIncrement:
//                incrementStep()
//            , onDecrement:
//                decrementStep()
//            )
            
            Stepper("", onIncrement: {
                // Remove the focus from the (text) field
                focusedField = nil
                
                self.quantity += 1
            }, onDecrement: {
                // Remove the focus from the (text) field
                focusedField = nil
                
                self.quantity -= 1
            }
            )
        }
    }
    
    func incrementStep() {
        // Remove the focus from the (text) field
        focusedField = nil
        
        self.quantity += 5
    }
    
    func decrementStep() {
        // Remove the focus from the (text) field
        focusedField = nil
        
        self.quantity -= 5
    }
}

struct StepperView: View {
    @State private var value = 0
    let step = 5
    let range = 1...50


    var body: some View {
        Stepper(
            value: $value,
            in: range,
            step: step
        ) {
            Text("Current: \(value) in \(range.description) " +
                 "stepping by \(step)")
        }
        .padding(10)
    }
}

#Preview {
    StepperView()
}
