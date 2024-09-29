//
//  PythonDbService.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/26/24.
//

import Foundation


class PythonDbService: ObservableObject {
    
    // A published property to hold the response data
    @Published var responseData: String = ""
    
    func saveExercise(exercise: Exercise) {
        // URL of the Python server endpoint (replace with your server's URL)
        guard let url = URL(string: "http://127.0.0.1:5000/add_exercise") else {
            print("Invalid URL")
            return
        }
        
        // Prepare the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Encode the exercise data to JSON
        do {
            let jsonData = try JSONEncoder().encode(exercise)
            request.httpBody = jsonData
        } catch {
            print("Failed to encode exercise data: \(error)")
            return
        }
        
        // Create the URLSession task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Check for errors
            if let error = error {
                DispatchQueue.main.async {
                    self.responseData = "Error: \(error.localizedDescription)"
                }
                return
            }
            
            // Parse the data
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.responseData = responseString
                }
            } else {
                DispatchQueue.main.async {
                    self.responseData = "No data or invalid response"
                }
            }
        }
        
        // Start the task
        task.resume()
    }
    
}
