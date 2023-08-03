//
//  NoNetworkView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 6/4/23.
//

import SwiftUI

struct NoNetworkView: View {
  //  @Binding var isShowingNoNetworkView: Bool
  @Environment(\.dismiss) private var dismiss
  var body: some View {
    VStack {
      Image(systemName: "wifi.slash")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
        .padding()
      Text("Oops, No Network Connection.")
        .font(.title3)
        .multilineTextAlignment(.center)
        .foregroundColor(.secondary)
        .padding()
      Button {
        dismiss()
      } label: {
        Text("Back".uppercased())
          .font(.title3)
          .bold()
          .foregroundColor(.white)
          .frame(width: 120, height: 52)
          .background(Color.blue)
          .cornerRadius(12)
      }
    }
  }
}
struct NoNetworkView_Previews: PreviewProvider {
  static var previews: some View {
    NoNetworkView()
  }
}
