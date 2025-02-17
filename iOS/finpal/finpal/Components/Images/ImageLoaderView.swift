//
//  ImageLoaderView.swift
//  finpal
//
//  Created by Abdulkarim Koshak on 2/10/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var urlString = Constants.randomImageURL
    var resizingMode: ContentMode = .fill
    var forceTransitionAnimation: Bool = false
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
            .clipped()
            .ifSatisfiedCondition(forceTransitionAnimation) { content in
                content
                    .drawingGroup()
            }
    }
}

#Preview {
    ImageLoaderView()
        .frame(maxWidth: .infinity)
        .frame(height: 215)
}
