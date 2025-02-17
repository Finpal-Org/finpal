//
//  PasswordStrengthView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/8/25.
//

import SwiftUI

enum PasswordStrength {
    case none
    case weak
    case moderate
    case strong
    
    var level: Int {
        switch self {
        case .none:
            return 0
        case .weak:
            return 1
        case .moderate:
            return 2
        case .strong:
            return 4
        }
    }
    
    var color: Color {
        switch self {
        case .none:
            return Color.gray30
        case .weak:
            return Color.destructive50
        case .moderate:
            return Color.yellow
        case .strong:
            return Color.accent
        }
    }
    
    var message: String {
        switch self {
        case .none:
            return ""
        case .weak:
            return "Weak! Please add more strength! 💪"
        case .moderate:
            return "Medium strength. Keep going! 🚀"
        case .strong:
            return "Password strength: Great! 👍"
        }
    }
}

struct PasswordStrengthView: View {
    @Binding var password: String
    @Binding var strength: PasswordStrength
    
    var body: some View {
        VStack {
            // Strength Indicator
            HStack {
                ForEach(0..<4) { index in
                    Capsule()
                        .frame(height: 4)
                        .foregroundColor(index < strength.level ? strength.color : Color.gray30)
                }
            }
            
            // Strength Label
            Text(strength.message)
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundStyle(Color.gray60)
                .frame(maxWidth: .infinity, alignment: .leading)
                .animation(.easeInOut, value: strength)
        }
    }
}

private struct PreviewView: View {
    @State private var password: String = ""
    @State private var isValidPassword: Bool = true
    @State private var strength: PasswordStrength = .none
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Password")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.gray80)
            
            FinpalSecureField(password: $password, isNotValid: $isValidPassword)
                .onChange(of: password) { _, _ in
                    strength = evaluatePasswordStrength()
                }
            
            PasswordStrengthView(password: $password, strength: $strength)
        }
        .padding()
    }
    
    private func evaluatePasswordStrength() -> PasswordStrength {
        let passwordLength = password.count
        
        switch passwordLength {
        case 0:
            return .none
        case 1..<6:
            return .weak
        case 6..<10:
            return .moderate
        case 10...:
            return .strong
        default:
            return .none
        }
    }
}

#Preview {
    PreviewView()
}
