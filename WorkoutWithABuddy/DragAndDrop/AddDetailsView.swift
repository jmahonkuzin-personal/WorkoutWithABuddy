//
//  AddDetailsView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import Foundation

import SwiftUI

// ObservableObject class with a @Published property
//class WorkoutTypeDetailsObservable: ObservableObject {
//    @Published var details: DraggableWorkoutDetailsItem?
//}
//
//struct DraggableWorkoutDetailsItem: Identifiable, Hashable {
//    let id = UUID()
//    var text: String
//}

// The view that holds the day name and icon
struct AddDetailsView: View {
    
    @State private var exerciseList: [String] = [
        "Bicycle kicks",
        "Lemon squeezers",
        "30-60-90s"
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false, content: {
            VStack(spacing: 10, content: {
                Spacer()
                    .frame(height: 100)
                
                ForEach(exerciseList, id: \.self) { e in
                    WorkoutItemView()
                }
                
                Spacer()
                    .frame(height: 40)
            })
            .padding(.horizontal, 20)
        })
        .ignoresSafeArea()
        .background(.white)
    }
}


struct AddDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AddDetailsView()
    }
}
