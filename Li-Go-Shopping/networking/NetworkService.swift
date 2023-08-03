//
//  ProductsService.swift
//  Li-Go-Shopping
//
//  Created by bin li on 6/1/23.
//

import SwiftUI
protocol DataDownloadServiceProtocol {
  func getData(from url: URL) async throws -> Data
}
struct NetworkService: DataDownloadServiceProtocol {
  enum ProductDownloadError: Error {
    case invalidResponse
    case clientErrorResponses
    case serverErrorResponses
    case otherErrorResponses
  }
  var session: URLSession
  private var sessionConfiguration: URLSessionConfiguration
  init() {
    self.sessionConfiguration = URLSessionConfiguration.default
    self.session = URLSession(configuration: sessionConfiguration)
  }
  func getData(from url: URL) async throws -> Data {
    var data = Data()
    do {
      let (newData, response) = try await session.data(from: url)
      guard let httpResponse = response as? HTTPURLResponse else {
        throw ProductDownloadError.invalidResponse
      }
      switch httpResponse.statusCode {
      case 200...299:
        break
      case 400...499:
        throw ProductDownloadError.clientErrorResponses
      case 500...599:
        throw ProductDownloadError.serverErrorResponses
      default:
        throw ProductDownloadError.otherErrorResponses
      }
      data = newData
    } catch {
      print("error: \(error)")
    }
    return data
  }
}
