//
//  Furniture_appApp.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

@main
struct Furniture_appApp: App {
    // Initialize Core Data Stack
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

