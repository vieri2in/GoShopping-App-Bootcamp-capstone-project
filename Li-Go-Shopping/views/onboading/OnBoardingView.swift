//
//  OnBoardingView.swift
//  OnBoardingUI
//
//  Created by bin li on 5/30/23.
//

import SwiftUI

struct OnBoardingView: View {
  @Binding var shouldShowOnBoarding: Bool
  var body: some View {
    // swiftlint:disable line_length
    TabView {
      PageView(title: "First",
               message: "The person, be it gentleman or lady, who has not pleasure in a good novel, must be intolerably stupid.",
               imageName: "bell",
               showDismissButton: false,
               shouldShowOnBoarding: $shouldShowOnBoarding)
      PageView(title: "Second",
               message: "No amount of fire or freshness can challenge what a man will store up in his ghostly heart.",
               imageName: "flag",
               showDismissButton: false,
               shouldShowOnBoarding: $shouldShowOnBoarding)
      PageView(title: "Third",
               message: "We must take the good wherever we find it and try to remove the bad wherever it may be.",
               imageName: "headphones",
               showDismissButton: true,
               shouldShowOnBoarding: $shouldShowOnBoarding)
    }
    // swiftlint:enable line_length
    .tabViewStyle(PageTabViewStyle())
  }
}

struct OnBoardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnBoardingView(shouldShowOnBoarding: .constant(true))
  }
}
