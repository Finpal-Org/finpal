//
//  AppView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/6/25.
//

import SwiftUI

// tabbar - signed in
// onboarding - new user
// sign in - signed out

struct AppView: View {
    @State var appState: AppState = AppState()
    
    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            tabBar: {
                // Is user signed in -> Home Screen
                // Is user not signed in -> Sign In Screen
            },
            onboarding: {
                
            }
        )
        .environment(appState)
    }
}

#Preview("AppView - TabBar") {
    AppView(appState: AppState(showTabBar: true))
}

#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
