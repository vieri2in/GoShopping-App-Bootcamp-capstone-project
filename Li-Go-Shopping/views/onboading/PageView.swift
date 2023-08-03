//
//  PageView.swift
//  OnBoardingUI
//
//  Created by bin li on 5/30/23.
//

import SwiftUI

struct PageView: View {
  let title: String
  let message: String
  let imageName: String
  let showDismissButton: Bool
  @Binding var shouldShowOnBoarding: Bool
    var body: some View {
      VStack {
        Image(systemName: imageName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: Constants.OnBoading.imageViewLength, height: Constants.OnBoading.imageViewLength)
          .padding()
        Text(title)
          .font(.largeTitle)
          .padding()
        Text(message)
          .font(.title3)
          .multilineTextAlignment(.center)
          .foregroundColor(.secondary)
          .padding()
        if showDismissButton {
          Button {
            shouldShowOnBoarding.toggle()
          } label: {
            Text("Get Started")
              .bold()
              .foregroundColor(.white)
              .frame(width: 200, height: 50)
              .background(.green)
              .cornerRadius(6)
          }

        }
      }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
      PageView(title: "title",
               message: "message",
               imageName: "bell",
               showDismissButton: true,
               shouldShowOnBoarding: .constant(true))
    }
}
