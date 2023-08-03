//
//  UserCart.swift
//  Li-Go-Shopping
//
//  Created by bin li on 6/21/23.
//

import Foundation
// @MainActor
class UserCartListViewModel: ObservableObject {
  @Published var productQuantities: [ProductsInCart] = [] {
    didSet {
      getSubtotal()
      getTotalNumber()
    }
  }
  @Published var subTotal: Double = 0.0
  @Published var totalNumber: Int = 0
  private var products: [Product] {
    return productQuantities.map { $0.product }
  }
  init() {
//    self.productQuantities = populateProducts()
  }
  func populateProducts() -> [ProductsInCart] {
    return [
      ProductsInCart(
        id: UUID(),
        product: Product(
          id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
          price: 109.95, description: "-", category: .mensClothing,
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          rating: Product.Rating(rate: 3.9, count: 120)),
        quantity: 2),
      ProductsInCart(
        id: UUID(),
        product: Product(
          id: 2,
          title: "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
          price: 695, description: "-", category: .jewelery,
          image: "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
          rating: Product.Rating(rate: 4.6, count: 400)),
        quantity: 1),
      ProductsInCart(
        id: UUID(),
        product: Product(
          id: 3,
          title: "WD 2TB Elements Portable External Hard Drive - USB 3.0 ",
          price: 64, description: "-", category: .electronics,
          image: "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
          rating: Product.Rating(rate: 3.3, count: 203)),
        quantity: 4),
      ProductsInCart(
        id: UUID(),
        product: Product(
          id: 4,
          title: "Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin",
          price: 599, description: "-", category: .electronics,
          image: "https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg",
          rating: Product.Rating(rate: 2.9, count: 250)),
        quantity: 2),
      ProductsInCart(
        id: UUID(),
        product: Product(
          id: 5,
          title: "BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats",
          price: 56.99, description: "-", category: .womensClothing,
          image: "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
          rating: Product.Rating(rate: 2.6, count: 235)),
        quantity: 6)
    ]
  }
  func getSubtotal() {
    var result = 0.0
    for item in productQuantities {
      result += item.product.price * Double(item.quantity)
    }
    subTotal = result
  }
  func getTotalNumber() {
    var result = 0
    for item in productQuantities {
      result += item.quantity
    }
    totalNumber = result
  }
//  func deleteProductViewModel(indexSet: IndexSet) {
//    productQuantities.remove(atOffsets: indexSet)
//  }
  func addProductViewModel(for productsInCart: ProductsInCart) {
    productQuantities.append(productsInCart)
  }
  func deleteProductViewModel(for productsInCart: ProductsInCart) {
    guard let index = products.firstIndex(of: productsInCart.product) else {
      print("This product was not found.")
      return
    }
    productQuantities.remove(at: index)
  }
  func incrementQuantity(for productsInCart: ProductsInCart) {
    guard let index = products.firstIndex(of: productsInCart.product) else {
      print("This product was not found.")
      return
    }
    productQuantities[index].incrementQuantity()
  }
  func decrementQuantity(for productsInCart: ProductsInCart) {
    guard let index = products.firstIndex(of: productsInCart.product) else {
      print("This product was not found.")
      return
    }
    productQuantities[index].decrementQuantity()
  }
}
