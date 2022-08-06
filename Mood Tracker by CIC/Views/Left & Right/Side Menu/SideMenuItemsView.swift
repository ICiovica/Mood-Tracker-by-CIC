//
//  SideMenuItemsView.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import SwiftUI

struct SideMenuItemsView: View {
    @AppStorage("selectedMenu") var selectedMenu: SelectedMenu = .home
    
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                Text("BROWSE")
                    .customFont(.subheadline2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                VStack {
                    ForEach(SideMenuItems.menuItems) { item in
                        Rectangle()
                            .frame(height: 1)
                            .opacity(0.25)
                        SideMenuRow(item: item, selectedMenu: $selectedMenu)
                    }
                }
                .padding()
            }
            
            VStack {
                Text("HISTORY")
                    .customFont(.subheadline2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                VStack {
                    ForEach(SideMenuItems.menuItems2) { item in
                        Rectangle()
                            .frame(height: 1)
                            .opacity(0.25)
                        SideMenuRow(item: item, selectedMenu: $selectedMenu)
                    }
                }
                .padding()
            }
            
            VStack {
                Text("SETTINGS")
                    .customFont(.subheadline2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                SideMenuRow(item: SideMenuItems.menuItems3[0], selectedMenu: $selectedMenu)
                    .padding()
            }
        }
    }
}
