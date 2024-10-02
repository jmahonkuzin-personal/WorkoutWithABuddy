//
//  WeightUnitPickerView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI

struct WeightUnitPickerView: View {
    @Binding var selectedWeightUnit: String
    let weightUnits = ["lbs", "kg"]

    var body: some View {
        VStack {
            Picker("Options", selection: $selectedWeightUnit) {
                ForEach(weightUnits, id: \.self) { weightUnit in
                    Text(weightUnit).tag(weightUnit)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct WeightUnitPickerView_ParentView: View {
    @State private var textInput: String = "lbs"

    var body: some View {
        VStack {
            WeightUnitPickerView(selectedWeightUnit: $textInput)
        }
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        WeightUnitPickerView_ParentView()
    }
}
