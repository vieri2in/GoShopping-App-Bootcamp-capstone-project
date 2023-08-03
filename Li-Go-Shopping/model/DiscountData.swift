//
//  DiscountData.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/13/23.
//

import Foundation
enum DiscountType: UInt, CaseIterable {
  case Default = 5
  case NationalDay = 10
  case BlackFriday = 15
  case Newyear = 20
}

struct DiscountData {
  var itemPrices: [Double: Int] = [:]
  var discountType: DiscountType
  var totalAmount: Double {
    var sum = 0.0
    for(price, quantity) in itemPrices {
      sum += price * Double(quantity)
    }
    return sum
  }
  var totalDiscountedAmount: Double {
    return totalAmount * (Double(discountType.rawValue)) / 100.0
  }
  var totalAmountAfterDiscount: Double {
    return totalAmount - totalDiscountedAmount
  }
  var roundedTotalDiscountedAmount: UInt {
    return UInt(totalDiscountedAmount.rounded())
  }
  func getTotalAmountAfterApplyingDiscount(newDiscountType: DiscountType) -> Double {
    return totalAmount - totalAmount * (Double(newDiscountType.rawValue)) / 100.0
  }
  static var maxDiscount: DiscountType = .Newyear
}

extension DiscountData {
  init(newProducts: [Product: Int], newDiscountType: DiscountType
  ) {
    for(product, quantity) in newProducts {
      itemPrices[product.price] = quantity
    }
    discountType = newDiscountType
  }
}
