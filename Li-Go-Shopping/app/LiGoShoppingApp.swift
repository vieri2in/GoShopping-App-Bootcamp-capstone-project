//
//  Li_Go_ShoppingApp.swift
//  Li-Go-Shopping
//
//  Created by bin li on 4/9/23.
//

import SwiftUI

@main
struct LiGoShoppingApp: App {
  @StateObject var userCartListVM = UserCartListViewModel()
    var body: some Scene {
        WindowGroup {
          LaunchView()
            .environmentObject(userCartListVM)
        }
    }
}
