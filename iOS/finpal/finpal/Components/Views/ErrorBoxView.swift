//
//  ErrorBoxView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/7/25.
//

import SwiftUI

struct ErrorBoxView: View {
    private var title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "exclamationmark.circle")
                .bold()
                .foregroundStyle(.destructive60)
            
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundStyle(.gray80)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 45)
        .background(.destructive5)
        .clipShape(.rect(cornerRadius: 16))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.destructive60, lineWidth: 1)
        }
    }
}

#Preview {
    ErrorBoxView("ERROR: Password does not match!")
}
