//
//  SignUpScreen.swift
//  SmartTravel 1
//
//  Created by MEGH SHAH on 2023-10-05.
//

import SwiftUI
import FirebaseAuth

struct SignUpScreen: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title)
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                signUp()
            }) {
                Text("Sign Up")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()

            if let error = authViewModel.error {
                Text(error.localizedDescription)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .onAppear {
            // You can set up any additional initialization code here if needed
        }
    }

    private func signUp() {
        // Check if password and confirmPassword match
        guard password == confirmPassword else {
            authViewModel.error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Passwords do not match"])
            return
        }

        // Attempt to create a user with Firebase Authentication
        authViewModel.email = email
        authViewModel.password = password
        authViewModel.signUp()
    }
}

