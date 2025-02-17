//
//  OnboardingView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/6/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack {
            Color.brand5.ignoresSafeArea()
            
            walkthroughScreens()
        }
    }
    
    private func walkthroughScreens() -> some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            ZStack {
                ForEach(Intro.screens.indices, id: \.self) { index in
                    screenView(size: size, index: index)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    @ViewBuilder
    private func screenView(size: CGSize, index: Int) -> some View {
        let intro = Intro.screens[index]
        
        VStack {
            // Image
            Spacer()
            
            Image(intro.imageName)
                .padding(16)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.spring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            VStack(spacing: 12) {
                // Title
                Text(intro.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 32)
                    .padding(.horizontal)
                    .offset(x: -size.width * CGFloat(currentIndex - index))
                    .animation(.spring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
                
                // Description
                Text(intro.description)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .offset(x: -size.width * CGFloat(currentIndex - index))
                    .animation(.spring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            }
            
            displayProgressDots()
            
            Spacer()
            
            VStack(spacing: 12) {
                nextButton
                signInButton
            }
            .padding()
            
            Spacer()
        }
    }
    
    private func displayProgressDots() -> some View {
        HStack {
            ForEach(Intro.screens.indices, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? .accent : .brand20)
                    .frame(width: 12, height: 12)
                    .animation(.smooth, value: currentIndex)
            }
        }
        .padding(.top, 20)
    }
    
    private var nextButton: some View {
        HStack {
            Text("Get Started")
            
            Image(systemName: "arrow.right")
        }
        .callToActionButton()
        .anyButton {
            onGetStartedPressed()
        }
    }
    
    private var signInButton: some View {
        NavigationLink {
            LoginView()
                .navigationBarBackButtonHidden()
        } label: {
            Text("Sign In")
                .secondaryButton(backgroundColor: Color.clear)
        }
    }
    
    private func onGetStartedPressed() {
        if currentIndex < 4 {
            currentIndex += 1
        }
    }
}

#Preview {
    OnboardingView()
}
