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

    init() {
            // 請求通知權限
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if let error = error {
                    print("通知權限請求失敗: \(error)")
                }
                if granted {
                    print("通知權限已授予")
                } else {
                    print("通知權限被拒絕")
                }
            }
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            ShoppingCartView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

