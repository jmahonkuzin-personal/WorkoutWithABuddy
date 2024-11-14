//
//  NewRoutineView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/15/24.
//

import SwiftUI

struct NewRoutineView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: DetailView()) {
                Text("Go to Detail Screen")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}



#Preview {
    NewRoutineView()
}
