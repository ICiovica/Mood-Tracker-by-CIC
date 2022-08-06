//
//  SideMenuRow.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import SwiftUI

struct SideMenuRow: View {
    var item: MenuItem
    @Binding var selectedMenu: SelectedMenu
    var body: some View {
        HStack {
            item.icon.view()
                .frame(width: 32, height: 32)
                .opacity(0.75)
            Text(item.text)
                .customFont(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.blue)
                .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
                .frame(maxWidth: .infinity, alignment: .leading)
        )
        .background(Color("Background 2"))
        .onTapGesture {
            item.icon.setInput("active", value: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                item.icon.setInput("active", value: false)
            }
            withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)) {
                selectedMenu = item.menu
            }
        }
    }
}
