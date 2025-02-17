//
//  SettingsListItemView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/10/25.
//

import SwiftUI

struct SettingsListItemView: View {
    var title: String
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 345, height: 64)
            .foregroundStyle(.white)
            .overlay {
                HStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.gray5)
                        .overlay {
                            Image(systemName: imageName)
                                .font(.system(size: 20))
                        }
                    
                    Text(title)
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .foregroundStyle(.gray40)
                    
                }
                .padding()
            }
    }
}

private struct PreviewView: View {
    var body: some View {
        ZStack {
            Color.gray5.ignoresSafeArea()
            
            SettingsListItemView(title: "Profile Info", imageName: "person") {
                
            }
        }
    }
}

#Preview {
    PreviewView()
}
