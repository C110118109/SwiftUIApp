import SwiftUI
import UserNotifications


struct ShoppingCartView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var cartItems: FetchedResults<CartItem>

    @State private var showAlert = false // 用于控制 Alert 的显示
    
    @Environment(\.presentationMode) var presentationMode // 添加這行代碼
    
    var groupedItems: [String: (price: Int64, quantity: Int64)] {
        Dictionary(grouping: cartItems, by: { $0.name })
            .mapValues { items in
                (
                    price: items.first?.price ?? 0,
                    quantity: items.reduce(0) { $0 + $1.quantity }
                )
            }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(groupedItems.keys.sorted(), id: \.self) { name in
                    HStack {
                        Text(name)
                        Spacer()
                        Text("$\(groupedItems[name]!.price)")  // 使用價格
                        Text("x\(groupedItems[name]!.quantity)")  // 使用數量
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("購物車")
            .navigationBarItems(trailing: Button("送出訂單") {
                placeOrder()
            })
            .alert(isPresented: $showAlert) { // Alert 配置
                Alert(
                    title: Text("成功"),
                    message: Text("已送出訂單！"),
                    dismissButton: .default(Text("確定"), action: {
                        clearCart() // 清空購物車
                        presentationMode.wrappedValue.dismiss() // 返回到上一個畫面
                    })
                )
            }
        }
    }

    

    private func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = cartItems[index]
            viewContext.delete(item)
        }
        do {
            try viewContext.save()
        } catch {
            print("品項刪除失敗: \(error)")
        }
    }

    private func placeOrder() {
        // 1. 显示 Alert
        showAlert = true

        // 2. 发出本地通知
        sendNotification()

        // 3. 其他逻辑（例如向服务器发送订单数据）
        let items = cartItems.map { $0.name }
        print("Order placed for: \(items)")
    }

    private func clearCart() {
        for item in cartItems {
            viewContext.delete(item)
        }
        do {
            try viewContext.save()
        } catch {
            print("清空購物車失敗: \(error)")
        }
    }

    
    	
    
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "訂單已送出"
        content.body = "您的訂單已成功送出，感謝您的購買！"
        content.sound = .default

        // 設置通知觸發條件（立即觸發，延遲1秒）
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        
        
        // 創建通知請求
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // 將通知添加到通知中心
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("通知發送失敗: \(error)")
            } else {
                print("通知已成功發送")
            }
        }
    }
	
}
	
