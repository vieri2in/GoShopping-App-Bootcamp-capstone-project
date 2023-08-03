//
//  FirstTabView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/6/23.
//

import SwiftUI
struct HomeTabView: View {
  @ObservedObject var modelDataManager: ProductsStore
  @ObservedObject var navigationStateManager: NavigationStateManager
  var body: some View {
    NavigationStack(path: $navigationStateManager.selectionPath) {
      RootView(productsStore: modelDataManager)
        .navigationDestination(for: Product.self) { product in
          HomeDetailView(product: product)
        }
    }
  }
}

struct FirstTabView_Previews: PreviewProvider {
  static var previews: some View {
    HomeTabView(modelDataManager: ProductsStore(), navigationStateManager: NavigationStateManager(selection: nil))
  }
}
