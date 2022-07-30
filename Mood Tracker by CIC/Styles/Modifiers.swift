//
//  Modifiers.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import SwiftUI

extension View {
    func topAndBottomModifier() -> some View {
        self
            .background(Color("Background 2")).opacity(0.875)
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0.75)], startPoint: .topLeading, endPoint: .bottomTrailing)))
    }
    
    func topAndBottomEffectModifier(isOpen: Bool, to: CGFloat) -> some View {
        self
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .offset(x: isOpen ? to * (UIScreen.main.bounds.width + 96) : 0)
            .scaleEffect(isOpen ? 0.9 : 1)
            .rotation3DEffect(.degrees(isOpen ? 32 : 0), axis: (x: 0, y: -1, z: 0))
    }
    
    func onTapWithAnimation(action: @escaping () -> Void) -> some View {
        self
            .onTapGesture {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.75)) {
                    action()
                }
            }
    }
}
