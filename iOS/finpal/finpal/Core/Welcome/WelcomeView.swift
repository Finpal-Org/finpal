//
//  WelcomeView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/6/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 64) {
                VStack(spacing: 0) {
                    Image(.logoPlain)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                    
                    Text("finpal")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Your Smart Personal Finance AI Companion UI Kit")
                        .font(.title2)
                        .fontWeight(.regular)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                }
                
                VStack(spacing: 12) {
                    featuresItemView("Smart Goal Tracking")
                    featuresItemView("Subscription Management")
                    featuresItemView("Finance Companion")
                    featuresItemView("AI-Powered Budgeting")
                    featuresItemView("Achievements & More!")
                }
                
                NavigationLink {
                    OnboardingView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("Get Started")
                        
                        Image(systemName: "arrow.right")
                    }
                    .callToActionButton()
                }
            }
            .padding()
        }
    }
    
    private func featuresItemView(_ title: String) -> some View {
        Label {
            Text(title)
                .font(.callout)
                .fontWeight(.medium)
        } icon: {
            Image(systemName: "checkmark.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.accent)
        }
    }
}

#Preview {
    NavigationStack {
        WelcomeView()
    }
}
