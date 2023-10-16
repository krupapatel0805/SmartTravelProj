import SwiftUI
import FirebaseAuth

struct ContentView: View {
    private let splashDuration: Double = 2.0
    @State private var isLoggedIn = false
    @ObservedObject var authViewModel: AuthViewModel
    @State private var isSignUp = false // Added state to track if the user wants to sign up

    var body: some View {
        NavigationView {
            ZStack {
                if isLoggedIn {
                    MainScreen()
                } else {
                    if isSignUp {
                       
                        SignUpScreen(authViewModel: authViewModel, isSignUp: $isSignUp)
                    } else {
                        SignInScreen(isLoggedIn: $isLoggedIn, authViewModel: authViewModel)

                        Button(action: {
                            isSignUp = true
                        }) {
                            Text("Sign Up")
                        }
                        .padding()
                    }
                }
            }
            .onAppear {
               
            }
        }
    }
}
