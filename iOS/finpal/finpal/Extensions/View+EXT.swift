//
//  View+EXT.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/6/25.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func callToActionButton(_ stroke: Bool = false) -> some View {
        if stroke {
            self
        } else {
            self
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(.accent, in: .capsule)
        }
    }
}
