//
//  RegistrationView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/8/25.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(AppState.self) private var root
    
    @State private var email = ""
    
    @State private var password = ""
    @State private var showPassword = false
    
    @State private var confirmPassword = ""
    @State private var showConfirmPassword = false
    
    @State private var strength: PasswordStrength = .none
    
    var body: some View {
        ZStack {
            Color.gray5.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 48) {
                    Spacer()
                    
                    // Logo and Title
                    VStack {
                        Image(.logoPlain)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                        
                        Text("Sign Up to finpal")
                            .font(.title)
                            .bold()
                    }
                    
                    // Input Fields
                    VStack(spacing: 28) {
                        // Email Address Field
                        VStack(alignment: .leading) {
                            Text("Email Address")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray80)
                            
                            FinpalTextField(
                                text: $email,
                                placeholder: "Enter your email address...",
                                keyboardType: .emailAddress,
                                symbol: "envelope"
                            )
                            .frame(height: 48)
                        }
                        
                        // Password Field and Strength Indicator
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Password")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray80)
                            
                            FinpalSecureField(password: $password, isNotValid: .constant(false))
                                .onChange(of: password) { oldValue, newValue in
                                    strength = evaluatePasswordStrength()
                                }
                                .frame(height: 48)
                            
                            PasswordStrengthView(password: $password, strength: $strength)
                        }
                        
                        // Confirm Password Field
                        VStack(alignment: .leading) {
                            Text("Confirm Password")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray80)
                            
                            FinpalSecureField(password: $confirmPassword, isNotValid: .constant(false))
                                .frame(height: 48)
                        }
                    }
                    
                    // Buttons
                    VStack(spacing: 32) {
                        Text("Create Account")
                            .callToActionButton()
                            .anyButton(.press) {
                                root.updateViewState(showTabBar: true)
                            }
                        
                        NavigationLink {
                            LoginView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("I Already Have Account")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundStyle(.accent)
                                .underline()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
    
    private func evaluatePasswordStrength() -> PasswordStrength {
        let passwordLength = password.count
        
        switch passwordLength {
        case 0:
            return .none
        case 1..<6:
            return .weak
        case 6..<10:
            return .moderate
        case 10...:
            return .strong
        default:
            return .none
        }
    }
}

#Preview {
    RegistrationView()
        .environment(AppState())
}
