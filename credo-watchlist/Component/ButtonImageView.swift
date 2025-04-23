//
//  ButtonImageView.swift
//  credo-watchlist
//
//  Created by Alan Milke on 23/04/25.
//

import SwiftUI

struct ButtonImageView: View {
    
    let symbolName: String
    
    var body: some View {
        Image(systemName: symbolName)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.blue.gradient)
            .padding(8)
            .background {
                Circle()
                    .fill(.ultraThinMaterial)
            }
            .frame(width: 80)
    }
}

#Preview {
    ButtonImageView(symbolName: "plus.circle.fill")
}
