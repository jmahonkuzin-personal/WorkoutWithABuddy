//
//  WorkoutDropdown.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import SwiftUI

struct ContentView: View {
    let icons = [
        "flame.fill", "bolt.fill", "heart.fill", "sun.max.fill", "drop.fill", "wind", "cloud.fill"
    ]
    
    @State private var selectedIcon: String = "flame.fill" // Default selected icon
    
    var body: some View {
        VStack {
            // Selected icon display
            HStack {
                Text("Selected Icon: ")
                Image(systemName: selectedIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .padding()
            
            // Picker for selecting icon
            Picker("Select Icon", selection: $selectedIcon) {
                ForEach(icons, id: \.self) { icon in
                    HStack {
                        Image(systemName: icon)
                        Text(icon)
                    }
                    .tag(icon) // Attach a tag to each picker option
                }
            }
            .pickerStyle(MenuPickerStyle()) // Picker style as dropdown menu
            .padding()
            .frame(width: 200, height: 40)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
