//
//  View+EXT.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/6/25.
//

import SwiftUI

extension View {
    
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(.accent)
            .clipShape(.capsule)
    }
    
    func secondaryButton(backgroundColor: Color = .white) -> some View {
        self
            .font(.headline)
            .foregroundStyle(.accent)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(backgroundColor)
            .clipShape(.capsule)
            .overlay {
                Capsule()
                    .stroke(.accent, lineWidth: 1.0)
            }
    }
    
    func removeListRowFormatting() -> some View {
        self
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(Color.clear)
    }
    
    @ViewBuilder
    func ifSatisfiedCondition(_ condition: Bool, transform: (Self) -> some View) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
