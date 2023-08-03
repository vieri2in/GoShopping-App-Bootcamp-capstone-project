//  Li_Go_ShoppingTests.swift
//  Li-Go-ShoppingTests
//
//  Created by bin li on 6/4/23.
//

import XCTest
@testable import Li_Go_Shopping
final class Li_Go_ShoppingSlowTests: XCTestCase {
  var sut: NetworkService!
  let networkMonitor = NetworkMonitor()
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = NetworkService()
  }
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  func testNetworkServicegetDataCompletion() throws {
    try XCTSkipUnless(
      networkMonitor.isConnected,
      "Network connectivity needed for this test."
    )
    //given
    let url = URL(string: "https://fakestoreapi.com/products")!
    let promise = expectation(description: "Completion handler invoked.")
    var statusCode: Int?
    var responseError: Error?
    //when
    let dataTask = sut.session.dataTask(with: url) { _, response, error in
      statusCode = (response as? HTTPURLResponse)?.statusCode
      responseError = error
      promise.fulfill()
    }
    dataTask.resume()
    wait(for: [promise], timeout: 5)
    //then
    XCTAssertNil(responseError)
    XCTAssertEqual(statusCode, 200)
  }
}
