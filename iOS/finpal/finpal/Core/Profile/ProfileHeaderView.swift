//
//  ProfileHeaderView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/11/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                // Background Image
                Image(.profileHeader)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .overlay(Color.black.opacity(0.3))
                
                
            }
            
            // Profile section
            VStack(spacing: 8) {
                ZStack(alignment: .bottomTrailing) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 96, height: 96)
                        .shadow(radius: 4)
                        .overlay {
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                        }
                        .offset(y: -50)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "camera.fill")
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(Color.green)
                            .clipShape(Circle())
                    }
                    .offset(x: 6, y: -40)
                }
                
                Text("Member since April 2024")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
                
                Text("John Doe")
                    .font(.system(size: 24, weight: .bold))
                
                HStack(spacing: 40) {
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.1), radius: 4)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.1), radius: 4)
                    }
                }
            }
            .offset(y: -50)
        }
        .frame(height: 300)
    }
}

struct SettingsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ProfileHeaderView()
                
                VStack(spacing: 8) {
                    Group {
                        SettingsRow(title: "Profile Info", icon: "person")
                    }
                    .padding(.horizontal)
                }
                .padding(.top, -100)
            }
        }
        .background(Color(.systemGray6))
        .ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    SettingsView()
}
