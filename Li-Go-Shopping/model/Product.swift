import Foundation
import SwiftUI
struct Product: Identifiable, Hashable, Codable {
  let id: Int
  var title: String
  var price: Double
  var description: String
  var category: Category
  var image: String
  var rating: Rating
  // swiftlint:disable line_length
  static let example = Product(id: 1,
                               title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95,
                               description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
                               category: .mensClothing,
                               image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                               rating: Product.Rating(rate: 3.9, count: 120))
  // swiftlint:enable line_length
}
struct ProductsInCart: Identifiable, Hashable {
  var id: UUID
  let product: Product
  var quantity: Int
  mutating func incrementQuantity() {
    quantity += 1
  }
  mutating func decrementQuantity() {
    guard quantity > 0 else {
      return
    }
    quantity -= 1
  }
}
