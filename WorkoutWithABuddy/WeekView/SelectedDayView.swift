//
//  SelectedDayView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation
import SwiftUI

struct SelectedDayView: View {
    //The @State property wrapper in SwiftUI is used to manage mutable state within a view. It allows the view to own and mutate its state, and whenever that state changes, SwiftUI automatically re-renders the view to reflect the new state.
    
    var selectedDay: WorkoutDay // see if you need @State modifier
        
    // Custom initializer without parameter labels
    init(_ selectedDay: WorkoutDay) {
        self.selectedDay = selectedDay
    }
    
    var body: some View {
        Text("Selected day: \(selectedDay)")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top, 10)
    }
}
