import SwiftUI
import FirebaseAuth

struct SignUpScreenView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var passwordStrengthFeedback: String = ""
    @Binding var isSignUp: Bool 

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title)
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)

            SecureField("Password", text: $password, onCommit: checkPasswordStrength)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text(passwordStrengthFeedback)
                .foregroundColor(passwordStrengthColor())
                .font(.footnote)
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
    }

    private func checkPasswordStrength() {
        let strength = calculatePasswordStrength(password)
        passwordStrengthFeedback = passwordStrengthFeedbackText(for: strength)
    }

    private func signUp() {
        guard password == confirmPassword else {
            authViewModel.error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Passwords do not match"])
            return
        }

        
        authViewModel.email = email
        authViewModel.password = password
        authViewModel.signUp()

   
        if authViewModel.isAuthenticated {
           
            isSignUp = false
        }
    }
 





    private func calculatePasswordStrength(_ password: String) -> PasswordStrength {
        let length = password.count
            let hasUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
            let hasLowercase = password.rangeOfCharacter(from: .lowercaseLetters) != nil
            let hasDigit = password.rangeOfCharacter(from: .decimalDigits) != nil
            let hasSymbol = password.rangeOfCharacter(from: .symbols) != nil
            let isCommonPassword = isCommonlyUsedPassword(password)

            if length >= 8, hasUppercase, hasLowercase, hasDigit, hasSymbol, !isCommonPassword {
                return .strong
            } else if length >= 6, (hasUppercase || hasLowercase || hasDigit), !isCommonPassword {
                return .medium
            } else {
                return .weak
            }
    }
    
    private func isCommonlyUsedPassword(_ password: String) -> Bool {
        let commonPasswords = [
            "password",
            "123456",
            "qwerty",
            "admin",
            "letmein",
            "welcome",
          
        ]

       
        let lowercasePassword = password.lowercased()

    
        return commonPasswords.contains(lowercasePassword)
    }


    private func passwordStrengthFeedbackText(for strength: PasswordStrength) -> String {
        switch strength {
        case .strong:
            return "Password strength: Strong"
        case .medium:
            return "Password strength: Medium"
        case .weak:
            return "Password strength: Weak"
        }
    }

    private func passwordStrengthColor() -> Color {
        switch calculatePasswordStrength(password) {
        case .strong:
            return .green
        case .medium:
            return .orange
        case .weak:
            return .red
        }
    }
}

enum PasswordStrength {
    case weak, medium, strong
}

