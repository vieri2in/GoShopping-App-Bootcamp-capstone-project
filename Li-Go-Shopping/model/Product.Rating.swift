//
//  Product.Rating.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/20/23.
//

import Foundation
extension Product {
  struct Rating: Hashable, Codable {
    var rate: Double
    var count: Int
  }
}
