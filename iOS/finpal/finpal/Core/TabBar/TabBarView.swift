//
//  TabBarView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/10/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Receipts")
                .tabItem {
                    Label("Receipts", systemImage: "receipt")
                }

            Text("Home")
                .tabItem {
                    Label("Add Receipts", systemImage: "plus.circle.fill")
                }
            
            Text("Chat")
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
            
            TestSettingsView(currentUser: .mock)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    TabBarView()
        .environment(AppState())
}
