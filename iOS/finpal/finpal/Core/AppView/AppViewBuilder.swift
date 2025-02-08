//
//  AppViewBuilder.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/6/25.
//

import SwiftUI

struct AppViewBuilder<TabBarView: View, OnboardingView: View>: View {
    var showTabBar = false
    
    @ViewBuilder var tabBar: TabBarView
    @ViewBuilder var onboarding: OnboardingView
    
    var body: some View {
        ZStack {
            if showTabBar {
                tabBar
                    .transition(.move(edge: .trailing))
            } else {
                onboarding
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}

private struct PreviewView: View {
    @State private var showTabBar = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabBar: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    
                    Text("TabBar")
                }
            },
            onboarding: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    
                    Text("Onboarding")
                }
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    PreviewView()
}
