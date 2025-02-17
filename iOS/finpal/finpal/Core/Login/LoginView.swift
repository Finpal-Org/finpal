//
//  LoginView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/7/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var rememberMe: Bool = true
    @State private var showError: Bool = false
    @State private var showForgotPassword: Bool = false
    
    var body: some View {
        ZStack {
            Color.gray5.ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Logo and Title
                VStack(spacing: 24) {
                    Image(.logoPlain)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                    
                    Text("Sign In to finpal")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                }
                
                // Fields
                VStack(spacing: 24) {
                    emailAddressField
                    passwordField
                    rememberMeButton
                    
                    if showError {
                        ErrorBoxView("ERROR: Password does not match!")
                            .transition(.move(edge: .bottom))
                            
                    }
                    
                }
                
                // Buttons
                VStack(spacing: 12) {
                    signInButton
                    createNewAccountButton
                }
                
                forgotPasswordButton
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showForgotPassword) {
            ForgotPasswordView()
        }
    }
    
    private var emailAddressField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Email Address")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.gray80)
            
            FinpalTextField(
                text: $email,
                placeholder: "Enter your email address...",
                keyboardType: .emailAddress,
                symbol: "envelope"
            )
        }
    }
    
    private var passwordField: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Password")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.gray80)
            
            FinpalSecureField(password: $password, isNotValid: $showError)
        }
    }
    
    private var rememberMeButton: some View {
        HStack(spacing: 8) {
            Image(systemName: rememberMe ? "checkmark.circle.fill" : "circle")
                .frame(width: 20, height: 20)
                .foregroundStyle(.accent)
                .onTapGesture {
                    rememberMe.toggle()
                }
            
            Text("Remember for 30 days")
                .font(.callout)
                .fontWeight(.medium)
            
            Spacer()
        }
    }
    
    private var signInButton: some View {
        Text("Sign In")
            .callToActionButton()
            .anyButton(.press) {
                withAnimation(.smooth) {
                    showError.toggle()
                }
            }
    }
    
    private var createNewAccountButton: some View {
        NavigationLink {
            RegistrationView()
                .navigationBarBackButtonHidden()
        } label: {
            Text("Create New Account")
                .secondaryButton()
        }
    }
    
    private var forgotPasswordButton: some View {
        Button {
            onForgotPasswordPressed()
        } label: {
            Text("Forgot Password")
                .font(.callout)
                .fontWeight(.semibold)
                .underline()
        }
    }
    
    private func onForgotPasswordPressed() {
        showForgotPassword = true
    }
    
}

#Preview {
    LoginView()
}
