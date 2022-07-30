//
//  TabBarItems.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import Foundation
import RiveRuntime

struct TabItems {
    static let tabItems = [
        TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), tab: .chat),
        TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), tab: .search),
        TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), tab: .timer),
        TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), tab: .bell),
        TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user)
    ]
}

enum Tab: String {
    case chat
    case search
    case timer
    case bell
    case user
}

struct TabItem: Identifiable {
    var id = UUID()
    var icon: RiveViewModel
    var tab: Tab
}
