//
//  LDSDirectoryApp.swift
//  LDSDirectory
//
//  Created by Carlos Bastida on 7/5/23.
//

import SwiftUI

@main
struct LDSDirectoryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
