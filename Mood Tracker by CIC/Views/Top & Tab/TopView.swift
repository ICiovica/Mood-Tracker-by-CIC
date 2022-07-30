//
//  TopView.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import SwiftUI
import RiveRuntime

struct TopView: View {
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    @Binding var leftSideIsOpen: Bool
    @Binding var rightSideIsOpen: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Mood Tracker")
                .customFont(.title)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay(
                    HStack {
                        button.view()
                            .frame(width: 40, height: 40)
                            .padding()
                            .onTapWithAnimation {
                                leftSideIsOpen = true
                            }
                            .onAppear {
                                button.setInput("isOpen", value: true)
                            }
                        Spacer()
                        Image(systemName: "person")
                            .frame(width: 35, height: 35)
                            .background(.white)
                            .foregroundColor(.black)
                            .mask(Circle())
                            .padding()
                            .onTapWithAnimation {
                                rightSideIsOpen = true
                            }
                    }
                )
                .topAndBottomModifier()
                .frame(height: 40)
                .padding()
            Spacer()
        }
        .topAndBottomEffectModifier(isOpen: leftSideIsOpen, to: 1)
        .topAndBottomEffectModifier(isOpen: rightSideIsOpen, to: -1)
        .padding()
    }
}
