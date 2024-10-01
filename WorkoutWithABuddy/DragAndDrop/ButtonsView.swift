//
//  ButtonsView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        HStack {
            // Cancel Button
            Button(action: {
                // Add your cancel logic here
                print("Cancel button tapped")
            }) {
                Text("Cancel")
                    .frame(minWidth: 0, maxWidth: 80)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            // Save Button
            Button(action: {
                // Add your save logic here
                print("Save button tapped)")
            }) {
                Text("Save")
                    .frame(minWidth: 0, maxWidth: 80)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ButtonsView()
}
