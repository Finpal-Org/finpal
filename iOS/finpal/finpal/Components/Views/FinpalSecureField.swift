//
//  FinpalSecureField.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/7/25.
//

import SwiftUI

enum Field: Hashable {
    case showPasswordField
    case hidePasswordField
}

struct FinpalSecureField: View {
    
    enum Opacity: Double {
        case hide = 0.0
        case show = 1.0
        
        mutating func toggle() {
            switch self {
            case .hide:
                self = .show
            case .show:
                self = .hide
            }
        }
    }
    
    @Binding var password: String
    @Binding var isNotValid: Bool
    
    @State private var isSecured: Bool = true
    @State private var hidePasswordFieldOpacity = Opacity.show
    @State private var showPasswordFieldOpacity = Opacity.hide
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack(alignment: .leading) {
            textFieldWithIconView
        }
        .animation(.default, value: isNotValid)
    }
    
    private var textFieldWithIconView: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(systemName: "lock")
                .font(.system(size: 20, weight: .semibold))
            
            textFieldView
        }
        .frame(maxWidth: .infinity, maxHeight: 48)
        .padding(.horizontal)
        .overlay {
            Capsule()
                .stroke(.gray30, lineWidth: 1)
        }
        .overlay {
            Capsule()
                .stroke(isNotValid ? Color.destructive60 : Color.clear, lineWidth: 1)
        }
    }
    
    private var textFieldView: some View {
        ZStack(alignment: .trailing) {
            securedTextField
            
            Button {
                performToggle()
            } label: {
                Image(systemName: isSecured ? "eye.slash" : "eye")
                    .tint(.gray30)
            }
        }
    }
    
    private var securedTextField: some View {
        Group {
            SecureField("", text: $password, prompt: Text("Enter your password...").foregroundStyle(.gray60))
                .foregroundStyle(.gray60)
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled()
                .focused($focusedField, equals: .hidePasswordField)
                .opacity(hidePasswordFieldOpacity.rawValue)
            
            TextField("", text: $password, prompt: Text("Enter your password...").foregroundStyle(.gray60))
                .foregroundStyle(.gray60)
                .textInputAutocapitalization(.never)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled()
                .focused($focusedField, equals: .showPasswordField)
                .opacity(showPasswordFieldOpacity.rawValue)
        }
    }
    
    private func performToggle() {
        isSecured.toggle()
        
        if isSecured {
            focusedField = .hidePasswordField
        } else {
            focusedField = .showPasswordField
        }
        
        hidePasswordFieldOpacity.toggle()
        showPasswordFieldOpacity.toggle()
    }
}

private struct PreviewView: View {
    
    @State private var password: String = ""
    @State private var isNotValid: Bool = true
    
    var body: some View {
        VStack {
            FinpalSecureField(password: $password, isNotValid: $isNotValid)
            
            Button("Validate") {
                isNotValid.toggle()
            }
        }
    }
}

#Preview {
    PreviewView()
}
