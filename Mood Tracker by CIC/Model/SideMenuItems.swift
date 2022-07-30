//
//  SideMenuItems.swift
//  Mood Tracker by CIC
//
//  Created by Ionut Ciovica on 30/07/2022.
//

import Foundation
import RiveRuntime

struct SideMenuItems {
    static let menuItems = [
        MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), menu: .home),
        MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), menu: .search),
        MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .favorites),
        MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .help)
    ]
    static let menuItems2 = [
        MenuItem(text: "History", icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), menu: .history),
        MenuItem(text: "Notifications", icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), menu: .notifications)
    ]
    static let menuItems3 = [
        MenuItem(text: "General", icon: RiveViewModel(fileName: "icons", stateMachineName: "SETTINGS_Interactivity", artboardName: "SETTINGS"), menu: .settings)
    ]
}

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}

enum SelectedMenu: String {
    case home
    case search
    case favorites
    case help
    case history
    case notifications
    case settings
}
