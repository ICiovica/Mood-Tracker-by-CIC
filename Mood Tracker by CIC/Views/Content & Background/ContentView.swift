//
//  ContentView.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    var body: some View {
        switch selectedTab {
        case .chat:
            EmptyView()
        case .search:
            EmptyView()
        case .timer:
            EmptyView()
        case .bell:
            EmptyView()
        case .user:
            EmptyView()
        }
    }
}
