//
//  SettingsRow.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/11/25.
//

import SwiftUI

struct SettingsRow: View {
    let title: String
    let icon: String
    var isDeleteAccount: Bool = false
    
    init(title: String, icon: String, isDeleteAccount: Bool = false) {
        self.title = title
        self.icon = icon
        self.isDeleteAccount = isDeleteAccount
    }
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(isDeleteAccount ? Color.destructive5 : Color.gray5)
                    .frame(width: 40, height: 40)
                
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundStyle(isDeleteAccount ? Color.destructive50 : Color.gray60)
            }
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray40)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}

#Preview {
    ZStack {
        Color.gray5.ignoresSafeArea()
        
        VStack {
            SettingsRow(title: "Profile Info", icon: "person")
            
            SettingsRow(title: "Delete Account", icon: "exclamationmark.triangle", isDeleteAccount: true)
        }
    }
}
