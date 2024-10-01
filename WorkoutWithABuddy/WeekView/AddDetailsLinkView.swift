//
//  AddDetailsLinkView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI

struct AddDetailsLinkView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: AddDetailsView()) {
                    Text("Add exercises")
                        .foregroundColor(.blue)
//                        .padding()
                }
            }
        }
    }
}

#Preview {
    AddDetailsLinkView()
}
