//
//  SideMenuView.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import SwiftUI
import RiveRuntime

struct SideMenuView: View {
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    @Binding var leftSideIsOpen: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .padding()
                    .background(.white.opacity(0.25))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text("Ionut Ciovica")
                        .customFont(.headline)
                    Text("Junior iOS Developer")
                        .customFont(.subheadline2)
                        .opacity(0.75)
                }
                Spacer()
                button.view()
                    .frame(width: 40, height: 40)
                    .onTapWithAnimation {
                        leftSideIsOpen = false
                    }
                    .onAppear {
                        button.setInput("isOpen", value: false)
                    }
            }
            .padding()
            
            SideMenuItemsView()
            
            Spacer()
        }
        .foregroundColor(.white)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 32, style: .continuous))
        .opacity(leftSideIsOpen ? 1 : 0)
        .offset(x: leftSideIsOpen ? 0 : -300)
        .rotation3DEffect(.degrees(leftSideIsOpen ? 0 : 30), axis: (x: 0, y: -1, z: 0))
        .padding(.horizontal, 32)
        .padding(.top)
    }
}
