//
//  PasswordResetView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/10/25.
//

import SwiftUI

struct PasswordResetView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.gray5.ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                Image(.passwordReset)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 296, height: 296)
                
                VStack(spacing: 12) {
                    Text("Password Reset Sent")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray80)
                    
                    Text("Please check your email in a few minutes - we’ve sent you an email containing password recovery link.")
                        .foregroundStyle(.gray60)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                    
                    NavigationLink {
                        LoginView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Continue")
                            .callToActionButton()
                            .padding()
                    }
                }
                
                VStack {
                    Text("Don't remember your email?")
                    
                    (
                        Text("Contact us at ")
                        +
                        Text("help@finpal.ai")
                            .font(.callout)
                            .underline()
                    )
                }
                .font(.subheadline)
                .foregroundStyle(.gray60)
                
            }
        }
    }
}

#Preview {
    PasswordResetView()
}
