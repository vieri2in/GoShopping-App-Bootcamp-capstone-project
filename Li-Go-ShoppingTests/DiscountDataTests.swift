//  DiscountData_Tests.swift
//  Li-Go-Shopping_Tests
//
//  Created by bin li on 5/13/23.
//
import XCTest
@testable import Li_Go_Shopping
final class DiscountDataTests: XCTestCase {
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  func test_DiscountData_TotalAmount_ShouldBeEqual() throws {
    let prices = [1.0, 2.0, 3.0, 4.0]
    let discountData = DiscountData(itemPrices: prices, discountType: .Default)
    XCTAssertEqual(discountData.totalAmount, 10.0)
  }
  func test_DiscountData_TotalDiscountedAmount_ShouldBeEqual() throws {
    let prices = [1.0, 2.0, 3.0, 4.0]
    let discountData = DiscountData(itemPrices: prices, discountType: .Default) // 0.05
    XCTAssertEqual(discountData.totalDiscountedAmount, 0.5)
  }
  func test_DiscountData_TotalAmountAfterDiscount_ShouldBeEqual() throws {
    let prices = [1.0, 2.0, 3.0, 4.0]
    let discountData = DiscountData(itemPrices: prices, discountType: .Default) // 0.05
    XCTAssertEqual(discountData.totalAmountAfterDiscount, 9.5)
  }
  func test_DiscountData_RoundedTotalDiscountedAmount_ShouldRound_15() throws {
    let prices = [1.0, 2.0, 3.0, 4.0]
    let discountData = DiscountData(itemPrices: prices, discountType: .BlackFriday) // 0.15
    XCTAssertEqual(discountData.roundedTotalDiscountedAmount, 2)
  }
  func test_DiscountData_RoundedTotalDiscountedAmount_ShouldRound_05() throws {
    let prices = [1.0, 2.0, 3.0, 4.0]
    let discountData = DiscountData(itemPrices: prices, discountType: .Default) // 0.05
    XCTAssertEqual(discountData.roundedTotalDiscountedAmount, 1)
  }
  func test_DiscountData_RoundedTotalDiscountedAmount_ShouldDrop_10() throws {
    let prices = [1.0, 2.0, 3.0, 4.0]
    let discountData = DiscountData(itemPrices: prices, discountType: .NationalDay) // 0.1
    XCTAssertEqual(discountData.roundedTotalDiscountedAmount, 1)
  }
  func test_DiscountData_GetTotalAmountAfterApplyingDiscount_ShouldBeEqual() throws {
    let prices = [1.0, 2.0, 3.0, 4.0]
    let discountData = DiscountData(itemPrices: prices, discountType: .NationalDay) // 0.1
    let result = discountData.getTotalAmountAfterApplyingDiscount(newDiscountType: .Default)
    XCTAssertEqual(result, 9.5)
  }
  func test_DiscountData_MaxDiscount_ShouldBeLargest() throws {
    var max: UInt = 0
    for i in DiscountType.allCases {
      max = max > i.rawValue ? max : i.rawValue
    }
    XCTAssertEqual(max, DiscountData.maxDiscount.rawValue)
  }
  func test_DiscountData_CustomedInitializer_ShouldBeEqual() throws {
    let products = [
      Product(id: 1, title: "a", price: 1.0, description: "",
              category: .electronics, image: "",
              rating: Product.Rating(rate: 1.0, count: 1)),
      Product(id: 2, title: "b", price: 2.0, description: "",
              category: .electronics, image: "",
              rating: Product.Rating(rate: 1.0, count: 1)),
      Product(id: 3, title: "c", price: 3.0, description: "",
              category: .electronics, image: "",
              rating: Product.Rating(rate: 1.0, count: 1)),
      Product(id: 4, title: "d", price: 4.0, description: "",
              category: .electronics, image: "",
              rating: Product.Rating(rate: 1.0, count: 1))
    ]
    let prices = [1.0, 2.0, 3.0, 4.0]
    let discountData = DiscountData(products: products, newDiscountType: .Default)
    XCTAssertEqual(discountData.itemPrices, prices)
  }
}
