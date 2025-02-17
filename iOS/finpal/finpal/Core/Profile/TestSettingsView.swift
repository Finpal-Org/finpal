//
//  TestSettingsView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/12/25.
//

import SwiftUI

struct TestSettingsView: View {
    @Environment(AppState.self) private var appState
    
    var currentUser: UserModel
    
    var body: some View {
        ZStack {
            Color.gray5.ignoresSafeArea()
            
            VStack {
                ZStack(alignment: .bottom) {
                    Image(.profileHeader)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 215)
                        .clipped()
                    
                    HStack(spacing: 24) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.1), radius: 4)
                        
//                        Circle()
//                            .fill(Color.white)
//                            .frame(width: 100, height: 100)
//                            .shadow(radius: 4)
//                            .overlay(
//                                Circle()
//                                    .stroke(Color.white, lineWidth: 4)
//                            )
                        
                        ImageLoaderView(urlString: currentUser.profileImageName ?? Constants.randomImageURL)
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                            .shadow(radius: 4)
                            .overlay {
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                            }
                        
                        Image(systemName: "slider.vertical.3")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.1), radius: 4)
                    }
                    .offset(y: 45)
                }
                .ignoresSafeArea(.all, edges: .top)
                
                Spacer()
                
                VStack(spacing: 8) {
                    (
                        Text("Member since ")
                        +
                        Text(currentUser.creationDate ?? .now, format: .dateTime.month().year())
                    )
                    .font(.caption)
                    .foregroundStyle(.gray60)
                    
                    Text(currentUser.name ?? "")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Section {
                            VStack {
                                SettingsRow(title: "Profile Info", icon: "person")
                                
                                SettingsRow(title: "Display & Appearance", icon: "paintpalette")
                                
                                SettingsRow(title: "Preferences", icon: "gearshape")
                                
                                SettingsRow(title: "Currency", icon: "dollarsign")
                                
                                SettingsRow(title: "About Us", icon: "questionmark")
                            }
                        } header: {
                            Text("General Settings")
                                .font(.callout)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                            .padding(20)
                        
                        Section {
                            VStack {
                                SettingsRow(title: "Push Notifications", icon: "bell")
                                
                                SettingsRow(title: "Sound Notification", icon: "speaker.2")
                                
                                SettingsRow(title: "Email Notification", icon: "envelope")
                            }
                        } header: {
                            Text("Notifications")
                                .font(.callout)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                            .padding(20)
                        
                        Section {
                            SettingsRow(title: "Delete Account", icon: "exclamationmark.triangle", isDeleteAccount: true)
                        } header: {
                            HStack {
                                Text("Danger Zone")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                Text("Careful")
                                    .font(.footnote)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.gray40)
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            
                            Text("Sign Out")
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.destructive60)
                        .frame(maxWidth: .infinity)
                        .padding(24)
                        .onTapGesture {
                            onSignOutPressed()
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .scrollIndicators(.hidden)
            }
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
    TestSettingsView(currentUser: .mock)
        .environment(AppState())
}
