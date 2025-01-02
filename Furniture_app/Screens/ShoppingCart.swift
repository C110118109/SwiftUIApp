////
////  ShoppingCart.swift
////  Furniture_app
////
////  Created by student on 2025/1/2.
////
//import SwiftUI
//
//struct ShoppingCartView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(sortDescriptors: []) private var cartItems: FetchedResults<CartItem>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(cartItems, id: \.self) { item in
//                    HStack {
//                        Text(item.name ?? "")
//                        Spacer()
//                        Text("\(item.price, specifier: "%.2f")")
//                        Text("x\(item.quantity)")
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .navigationTitle("Shopping Cart")
//            .navigationBarItems(trailing: Button("Place Order") {
//                placeOrder()
//            })
//        }
//    }
//
//    private func deleteItems(at offsets: IndexSet) {
//        offsets.forEach { index in
//            let item = cartItems[index]
//            viewContext.delete(item)
//        }
//        do {
//            try viewContext.save()
//        } catch {
//            print("Failed to delete item: \(error)")
//        }
//    }
//
//    private func placeOrder() {
//        let items = cartItems.map { $0.name ?? "" }
//        print("Order placed for: \(items)")
//        // Handle order placement logic (e.g., sending notification)
//    }
//}
