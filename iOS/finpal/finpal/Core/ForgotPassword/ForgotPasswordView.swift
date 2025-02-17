//
//  ForgotPasswordView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/8/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var email: String = ""
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Image(.forgotPassword)
                    .resizable()
                    .scaledToFit()
                
                VStack(spacing: 12) {
                    Text("Forgot Password")
                        .font(.title2)
                        .foregroundStyle(.gray80)
                        .bold()
                    
                    Text("Please enter your email address to reset your password.")
                        .foregroundStyle(.gray60)
                        .multilineTextAlignment(.center)
                }
                
                VStack(spacing: 12) {
                    FinpalTextField(
                        text: $email,
                        placeholder: "Enter your email address...",
                        keyboardType: .emailAddress,
                        symbol: "envelope"
                    )
                    
                    if showError {
                        ErrorBoxView("Invalid email address!")
                            .transition(.move(edge: .leading))
                    }
                }
                .padding(.horizontal)
                
                /*
                 withAnimation(.smooth) {
                     showError.toggle()
                 }
                 */
                NavigationLink {
                    PasswordResetView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Continue")
                        .callToActionButton()
                        .padding(.horizontal)
                }
                
                VStack {
                    Text("Don't remember your email?")
                    
                    (
                        Text("Contact us at ")
                        +
                        Text("help@finpal.ai")
                            .font(.headline)
                            .underline()
                    )
                }
                .font(.callout)
                .foregroundStyle(.gray60)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    toolbarView
                }
            }
        }
    }
    
    private var toolbarView: some View {
        Button {
            onDismissButtonPressed()
        } label: {
            Image(systemName: "xmark")
                .imageScale(.large)
                .fontWeight(.semibold)
                .foregroundStyle(.gray60)
        }
        .padding(.trailing)
    }
    
    private func onDismissButtonPressed() {
        dismiss()
    }
    
}

#Preview {
    ForgotPasswordView()
}
