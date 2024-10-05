//
//  LoginView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var userLoginService = UserLoginService()
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 150)
                    .padding(.bottom, 20)  // Adds space below the title
                // Username TextField
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                
                // Password SecureField
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                
                // Log In Button
                Button(action: {
                    let userLogin = UserObject(username: username, password: password)
                    userLoginService.verify_user(userLogin: userLogin)
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .disabled(username.isEmpty || password.isEmpty)
                .opacity(username.isEmpty || password.isEmpty ? 0.5 : 1.0)
                Spacer() // Pushes content upwards for a more centered look
            }
            
            // implement new user navigation link here
            
            // Success Navigation
            .navigationDestination(isPresented: Binding(
                get: { userLoginService.isSuccess == true },
                set: { _ in }))  //    The set closure is empty ({ _ in }) because we don’t need to write back any value; we only need to react to changes in isSuccess.
            {
                WeekWorkoutView()
                    .navigationBarBackButtonHidden(true)
            }
            
            // Error Navigation
            .navigationDestination(isPresented: Binding(
                get: { userLoginService.showErrorScreen == true },
                set: { _ in })) {
                ErrorView()
            }
        }
    }
}

// Error screen
struct ErrorView: View {
    var body: some View {
        Text("Login Failed!")
            .font(.largeTitle)
            .foregroundColor(.red)
            .padding()
    }
}

#Preview {
    LoginView()
}
