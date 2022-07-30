//
//  TabBarView.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import SwiftUI
import RiveRuntime

struct TabBarView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    @Binding var leftSideIsOpen: Bool
    @Binding var rightSideIsOpen: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                content
            }
            .padding()
            .topAndBottomModifier()
            .padding(.horizontal, 32)
        }
        .topAndBottomEffectModifier(isOpen: leftSideIsOpen, to: 1)
        .topAndBottomEffectModifier(isOpen: rightSideIsOpen, to: -1)
    }
    
    var content: some View {
        ForEach(TabItems.tabItems) { item in
            Button {
                item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    item.icon.setInput("active", value: false)
                }
                withAnimation {
                    selectedTab = item.tab
                }
            } label: {
                item.icon.view()
                    .frame(height: 40)
                    .opacity(selectedTab == item.tab ? 1 : 0.625)
                    .background(
                        VStack {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color.accentColor)
                                .frame(width: 32, height: 4)
                                .offset(y: -6)
                                .opacity(selectedTab == item.tab ? 1 : 0)
                            Spacer()
                        }
                    )
            }
        }
    }
}
