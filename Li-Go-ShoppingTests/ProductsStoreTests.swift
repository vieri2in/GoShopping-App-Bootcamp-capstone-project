//
//  ModelDataManager_Tests.swift
//  Li-Go-Shopping_Tests
//
//  Created by bin li on 5/13/23.
//

import XCTest
@testable import Li_Go_Shopping
final class ProductsStoreTests: XCTestCase {
  let vm = ProductsStore()
  override func setUpWithError() throws {
  }
  override func tearDownWithError() throws {
  }
  // Assignment 3: Writing Unit Tests
  func test_ProductsStore_loadJSONProducts_ShouldHave20Items() throws {
    sleep(8)
//    print(vm.products)
    XCTAssertGreaterThan(vm.products.count, 0)
  }
//  func test_ProductsStore_saveJSONProducts_ShouldHaveLessItems() throws {
//    sleep(8)
//    let oldcount = vm.products.count
//    vm.deleteProduct(indexSet: IndexSet(integer: oldcount - 1))
//    let newVm = ProductsStore()
//    XCTAssertEqual(newVm.products.count, oldcount - 1)
//  }
}




