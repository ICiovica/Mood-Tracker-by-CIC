//
//  ContentView.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import SwiftUI

struct MainView: View {
    @State var leftSideIsOpen: Bool = false
    @State var rightSideIsOpen: Bool = false
    
    var body: some View {
        ZStack {
            OnboardingView()
            SideMenuView(leftSideIsOpen: $leftSideIsOpen)
            SignInView(rightSideIsOpen: $rightSideIsOpen)
            
            TopView(leftSideIsOpen: $leftSideIsOpen, rightSideIsOpen: $rightSideIsOpen)
            
            ContentView()
            
            TabBarView(leftSideIsOpen: $leftSideIsOpen, rightSideIsOpen: $rightSideIsOpen)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
