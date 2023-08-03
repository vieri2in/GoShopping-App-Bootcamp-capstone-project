//
//  MockNetWorkService.swift
//  Li-Go-Shopping
//
//  Created by bin li on 6/1/23.
//

import SwiftUI
struct MockNetworkService: DataDownloadServiceProtocol {
  enum MockNetWorkServiceError: Error {
    case badPath
    case badData
  }
  func getData(from url: URL) async throws -> Data {
    guard let filePath = Bundle.main.path(forResource: "FakeProducts", ofType: "json") else {
      throw MockNetWorkServiceError.badPath
    }
    let fileURL = URL(filePath: filePath)

    var data = Data()
    do {
      data = try Data(contentsOf: fileURL, options: .mappedIfSafe)
    } catch {
      throw MockNetWorkServiceError.badData
    }
    return data
  }
}
