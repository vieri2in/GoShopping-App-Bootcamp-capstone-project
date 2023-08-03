//
//  NavigationStateManager.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/6/23.
//

import Foundation
class NavigationStateManager: ObservableObject {
  @Published var selection: Int
  @Published var selectionPath: [Product]
  init(selection: Int?, selectionPath: [Product] = [Product]()) {
    self.selection = selection ?? 1
    self.selectionPath = selectionPath
  }
  func goToRoot() {
    selectionPath = []
  }
  func goToPrevious() {
    selectionPath.removeLast()
  }
}
