import SwiftUI
import FirebaseAuth

struct SignInScreenView: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var signInError: String? = nil
    @ObservedObject var authViewModel: AuthViewModel
    @State private var isNavigating = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Sign In")
                    .font(.title)
                    .padding()

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    signIn()
                }) {
                    Text("Sign in")
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
                
                if isNavigating {
                    NavigationLink("", destination: MainScreen(), isActive: $isNavigating)
                        .isDetailLink(false)
                }
            }
            .padding()
        }
    }

    private func signIn() {
        authViewModel.email = email
        authViewModel.password = password
        authViewModel.signIn()

        if authViewModel.isAuthenticated {
            isLoggedIn = true
            isNavigating = true // Start the navigation to MainScreen
        }
    }
}


