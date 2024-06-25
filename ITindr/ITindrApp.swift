//
//  ITindrApp.swift
//  ITindr
//
//  Created by HITSStudent on 25.06.2024.
//

import SwiftUI

@main
struct ITindrApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
