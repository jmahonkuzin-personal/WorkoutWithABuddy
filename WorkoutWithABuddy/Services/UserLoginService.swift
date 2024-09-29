//
//  UserLoginService.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation

// figure out at some point how to put this in a folder and call it from another folder

// note that you can make this async when you want

// This is the view model class that handles the network request
class UserLoginService: ObservableObject {
    // A published property to hold the response data
    @Published var responseData: String = ""
    @Published var isSuccess: Bool = false // Determines if we should navigate to success screen
    @Published var showErrorScreen: Bool = false
    
    // Function to fetch data from an API (GET request)
    func verify_user(userLogin: UserObject) {
        // Build the query string and append it to the endpoint
        let queryString = buildQueryString(from: userLogin)
        let endpoint = "http://127.0.0.1:5000/verify_user"
        let fullURLString = endpoint + "?" + queryString
        
        // Ensure the URL is valid
        guard let url = URL(string: fullURLString) else {
            self.responseData = "Invalid URL"
            return
        }
        
        // Create the URLSession task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                DispatchQueue.main.async {
                    self.responseData = "Error: \(error.localizedDescription)"
                    self.isSuccess = false
                }
                return
            }
            
            // Parse the data
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.responseData = responseString
                    self.isSuccess = true
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
    
    // Function to build the query string from UserLogin object
    func buildQueryString(from userLogin: UserObject) -> String {
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "username", value: userLogin.username),
            URLQueryItem(name: "password", value: userLogin.password)
        ]
        return components.percentEncodedQuery ?? ""
    }
}
