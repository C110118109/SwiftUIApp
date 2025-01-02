import Foundation
import CoreData

@objc(CartItem)
public class CartItem: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartItem> {
        return NSFetchRequest<CartItem>(entityName: "CartItem")
    }
    
    @NSManaged public var name: String
    @NSManaged public var price: Int64
    @NSManaged public var quantity: Int64
}

