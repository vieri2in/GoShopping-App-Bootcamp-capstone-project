//
//  FileManager.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/20/23.
//

import Foundation
public extension FileManager {
  static var documentsDirectoryURL: URL {
    return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
