//  Li_Go_ShoppingFakeTests.swift
//  Li-Go-ShoppingTests
//
//  Created by bin li on 6/4/23.
//

import XCTest
@testable import Li_Go_Shopping
final class Li_Go_ShoppingFakeTests: XCTestCase {
  var sut: ProductsStore!
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = ProductsStore()
  }
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  func testProductsStoredecodeDataShouldBeValid() throws {
    //given
    let products = [Product(id: 1, title: "test",
                            price: 12.12, description: "--",
                            category: .electronics, image: "--",
                            rating: Product.Rating(rate: 1.2, count: 123))]
    let encoder = JSONEncoder()
    let productsData = try! encoder.encode(products)
    //when
    let promise = expectation(description: "Product ID correctly decoded.")
    let decodedProducts: [Product] = try! sut.decodeData(from: productsData)
    //then
    XCTAssertEqual(decodedProducts.first!.id, 1)
    promise.fulfill()
    wait(for: [promise], timeout: 5)
  }
}

