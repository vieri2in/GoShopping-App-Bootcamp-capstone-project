//
//  NavigationStateManager_Tests.swift
//  Li-Go-Shopping_Tests
//
//  Created by bin li on 5/13/23.
//
import XCTest
@testable import Li_Go_Shopping
final class NavigationStateManagerTests: XCTestCase {
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  func test_NavigationStateManager_Selection_ShouldSelect() throws {
    let selection = 2
    let vm = NavigationStateManager(selection: selection)
    XCTAssertEqual(vm.selection, 2)
  }
  func test_NavigationStateManager_GoToPrevious_ShouldGoBackOneStep() throws {
    let path = [
      Product(id: 1, title: "a", price: 1.0, description: "",
              category: .electronics, image: "",
              rating: Product.Rating(rate: 1.0, count: 1)),
      Product(id: 2, title: "b", price: 2.0, description: "",
              category: .electronics, image: "",
              rating: Product.Rating(rate: 1.0, count: 1)),
      Product(id: 3, title: "c", price: 3.0, description: "",
              category: .electronics, image: "",
              rating: Product.Rating(rate: 1.0, count: 1))
    ]
    let vm = NavigationStateManager(selection: nil, selectionPath: path)
    vm.goToPrevious()
    vm.goToPrevious()
    vm.goToPrevious()
    XCTAssertEqual(vm.selectionPath, [Product]())
  }
  func test_NavigationStateManager_GoToRoot_ShouldClearOut() throws {
    let path = [
      Product(id: 1, title: "a", price: 1.0, description: "",
              category: .electronics, image: "",
              rating: Product.Rating(rate: 1.0, count: 1)),
      Product(id: 2, title: "b", price: 2.0, description: "",
              category: .electronics, image: "",
              rating: Product.Rating(rate: 1.0, count: 1)),
      Product(id: 3, title: "c", price: 3.0, description: "",
              category: .electronics, image: "",
              rating: Product.Rating(rate: 1.0, count: 1))
    ]
    let vm = NavigationStateManager(selection: nil, selectionPath: path)
    vm.goToRoot()
    XCTAssertEqual(vm.selectionPath, [Product]())
  }
}
