//
//  FinpalTextField.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/7/25.
//

import SwiftUI

struct FinpalTextField: View {
    @Binding var text: String
    
    let placeholder: String
    let keyboardType: UIKeyboardType
    let symbol: String?
    
    private let textFieldLeading: CGFloat = 50
    
    var body: some View {
        TextField(text: $text) {
            Text(placeholder)
                .foregroundStyle(Color.gray60)
        }
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .frame(maxWidth: .infinity, maxHeight: 48)
        .padding(.leading, symbol == nil ? textFieldLeading / 2 : textFieldLeading)
        .keyboardType(keyboardType)
        .background {
            ZStack(alignment: .leading) {
                if let symbol {
                    Image(systemName: symbol)
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.leading)
                        .foregroundStyle(Color.gray60)
                }
                
                Capsule(style: .continuous)
                    .stroke(Color.gray30, lineWidth: 1)
            }
        }
    }
}

#Preview {
    FinpalTextField(
        text: .constant(""),
        placeholder: "Enter your email address...",
        keyboardType: .emailAddress,
        symbol: "envelope"
    )
}
