//
//  MacToDoApp.swift
//  MacToDo
//
//  Created by Victor Deon on 21/05/25.
//

import SwiftUI

@main
struct MacToDoApp: App {
    var body: some Scene {
        WindowGroup {
            TasksView()
                .preferredColorScheme(.light)
        }
    }
}
