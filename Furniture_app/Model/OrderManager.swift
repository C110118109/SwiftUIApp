//
//  OrderManager.swift
//  Furniture_app
//
//  Created by student on 2025/1/2.
//

import CoreData

func placeOrder() {
    let context = PersistenceController.shared.container.viewContext
    let fetchRequest: NSFetchRequest<CartItem> = CartItem.fetchRequest()
    let items = try? context.fetch(fetchRequest)
    
    items?.forEach { context.delete($0) }
    
    do {
        try context.save()
        print("Order placed successfully")
        // 顯示通知或其他UI提示
    } catch {
        print("Failed to place order: \(error)")
    }
}
