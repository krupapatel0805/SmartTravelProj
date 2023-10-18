import SwiftUI
import FirebaseAuth

struct SignInScreen: View {
    @Binding var isLoggedIn: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var signInError: String? = nil
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
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
                signIn() // Call the signIn function
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
        }
        .padding()

        // NavigationLink to HomeScreen
        NavigationLink("", destination: HomeScreen(), isActive: $isLoggedIn)
    }

    private func signIn() {
        authViewModel.email = email
        authViewModel.password = password
        authViewModel.signIn()
        
        // You can also handle navigation logic here
        if authViewModel.isAuthenticated {
            isLoggedIn = true // Update isLoggedIn to navigate to the home screen
        }
    }
}
