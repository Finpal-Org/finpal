//
//  ProfileView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/10/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(AppState.self) private var appState
    
    @State var currentUser: UserModel?
    
    var body: some View {
        ZStack {
            Color.gray5.ignoresSafeArea()
            
            List {
                ImageLoaderView(urlString: Constants.randomImageURL)
                    .frame(height: 215)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowBackground(Color.clear)
                    .zIndex(-1)
                
                HStack(spacing: 24) {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(.white)
                        .overlay {
                            Image(systemName: "gearshape")
                        }
                        .shadow(radius: 5)
                    
                    ImageLoaderView(urlString: currentUser?.profileImageName ?? Constants.randomImageURL)
                        .clipShape(Circle())
                        .frame(width: 96, height: 96)
                    
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(.white)
                        .overlay {
                            Image(systemName: "slider.vertical.3")
                        }
                        .shadow(radius: 5)
                }
                .offset(y: -50)
                .frame(maxWidth: .infinity)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
                VStack {
                    (
                        Text("Member since ")
                        +
                        Text(currentUser?.creationDate ?? .now, format: .dateTime.month().year())
                    )
                    .font(.caption)
                    .foregroundStyle(.gray60)
                    
                    Text(currentUser?.name ?? "")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
                Section {
                    VStack {
                        SettingsRow(title: "Profile Info", icon: "person")
                        
                        SettingsRow(title: "Display & Appearance", icon: "paintpalette")
                        
                        SettingsRow(title: "Subscription", icon: "calendar.badge.checkmark")
                        
                        SettingsRow(title: "Preferences", icon: "gearshape")
                        
                        SettingsRow(title: "Currency", icon: "dollarsign")
                        
                        SettingsRow(title: "About Us", icon: "questionmark")
                        
                        Divider()
                            .padding(.top, 32)
                            .padding(.horizontal)
                    }
                    .padding()
                } header: {
                    Text("General Settings")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray80)
                        .padding(.leading)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
                Section {
                    VStack {
                        SettingsRow(title: "Push Notification", icon: "bell")
                        
                        SettingsRow(title: "Sound Notification", icon: "speaker.2")
                        
                        SettingsRow(title: "Email Notification", icon: "envelope")
                        
                        Divider()
                            .padding(.top, 32)
                            .padding(.horizontal)
                    }
                    .padding()
                } header: {
                    Text("Notifications")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray80)
                        .padding(.leading)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
                Section {
                    VStack {
                        SettingsRow(title: "Change Password", icon: "lock")
                        
                        Divider()
                            .padding(.top, 32)
                            .padding(.horizontal)
                    }
                    .padding()
                } header: {
                    Text("Security")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray80)
                        .padding(.leading)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
                Section {
                    SettingsRow(title: "Delete Account", icon: "exclamationmark.triangle", isDeleteAccount: true)
                        .padding()
                } header: {
                    HStack {
                        Text("Danger Zone")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundStyle(.gray80)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("Careful")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(.gray40)
                            .padding(.trailing)
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
                Section {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        
                        Text("Sign Out")
                    }
                    .frame(maxWidth: .infinity)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.destructive60)
                    .onTapGesture {
                        onSignOutPressed()
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                
                
            }
            .ignoresSafeArea()
            .listStyle(.plain)
        }
    }
    
    func onSignOutPressed() {
        Task {
            await dismissScreen()
        }
    }
    
    private func dismissScreen() async {
        try? await Task.sleep(for: .seconds(1))
        appState.updateViewState(showTabBar: false)
    }
}

#Preview {
    ProfileView(currentUser: .mock)
        .environment(AppState())
}
