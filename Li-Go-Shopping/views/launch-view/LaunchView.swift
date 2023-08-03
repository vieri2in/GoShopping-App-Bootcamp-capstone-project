//
//  LaunchView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 6/14/23.
//

import SwiftUI
struct LaunchView: View {
  @State private var isActive = false
  @State private var size = 0.8
  @State private var opacity = 0.5
  @StateObject var networkMonitor = NetworkMonitor()
  var body: some View {
    if isActive {
      ContentView(navagationStateManager: NavigationStateManager(selection: nil))
        .environmentObject(networkMonitor)
    } else {
      VStack {
        VStack(spacing: 15) {
          Image(systemName: "gift")
            .font(.system(size: 100))
            .foregroundColor(.red)
          Text("Epic Shopping Start Here")
            .font(.title3)
//            .foregroundColor(.black.opacity(0.8))
            .opacity(0.8)
        }
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear {
          withAnimation(.easeIn(duration: 1.2)) {
            self.size = 0.9
            self.opacity = 1.0
          }
        }
      }
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
          self.isActive = true
        }
      }
    }
  }
}
struct LaunchView_Previews: PreviewProvider {
  static var previews: some View {
    LaunchView()
  }
}
