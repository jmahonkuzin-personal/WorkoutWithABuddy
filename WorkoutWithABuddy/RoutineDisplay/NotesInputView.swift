//
//  NotesInputView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/4/24.
//

import SwiftUI

struct NotesInputView: View {
    @State private var userInput: String = "" // State variable to store user input
    var body: some View {
        // TextField to take user input
        Text("Add any notes:")
        TextEditor(text: $userInput)
            .padding()
            .background(Color.clear) // Ensure background doesn't interfere with typing
            .frame(height: 100) // Adjust height as needed for your use case
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 2)
            )
    }
}

#Preview {
    NotesInputView()
}
