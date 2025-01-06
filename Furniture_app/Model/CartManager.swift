//
//  Untitled.swift
//  Furniture_app
//
//  Created by student on 2025/1/2.
//

import CoreData

func addToCart(name: String, price: Int64, quantity: Int64) {
    let context = PersistenceController.shared.container.viewContext
    let newItem = CartItem(context: context)
    newItem.name = name
    newItem.price = price
    newItem.quantity = quantity

    do {
        try context.save()
        print("存入資料 名稱：\(name) 價格：\(price)")	
    } catch {
        print("Failed to save cart item: \(error)")
    }
}


func fetchCartItems() -> [CartItem] {
    let context = PersistenceController.shared.container.viewContext
    let request: NSFetchRequest<CartItem> = CartItem.fetchRequest()

    do {
        return try context.fetch(request)
    } catch {
        print("Failed to fetch cart items: \(error)")
        return []
    }
}

func deleteCartItem(_ item: CartItem) {
    let context = PersistenceController.shared.container.viewContext
    context.delete(item)

    do {
        try context.save()
    } catch {
        print("Failed to delete cart item: \(error)")
    }
}

func calculateTotalPrice() -> Int64 {
    let items = fetchCartItems()
    return items.reduce(0) { $0 + ($1.price * Int64($1.quantity)) }
}


