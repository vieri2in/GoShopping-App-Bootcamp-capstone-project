//
//  Product.Category.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/20/23.
//

import Foundation
extension Product {
  enum Category: String, CaseIterable, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case mensClothing = "men's clothing"
    case womensClothing = "women's clothing"
  }
}
