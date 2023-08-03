//
//  TextView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 4/17/23.
//

import SwiftUI
struct BigBoldText: View {
  let text: String
  var body: some View {
    Text(text.uppercased())
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title)
//      .fontWeight(.black)
  }
}

struct TitleText: View {
  let text: String
  var body: some View {
    Text(text)
      .multilineTextAlignment(.center)
      .font(.title3)
  }
}
struct BodyText: View {
  let text: String
  var body: some View {
    Text(text)
      .font(.body)
      .fontWeight(.light)
      .multilineTextAlignment(.leading)
//      .lineSpacing(12)
      .padding(.horizontal)
  }
}
struct MarketHeaderText: View {
  let text: String
  var body: some View {
    Text(text)
    .font(.title3)
    .padding(.vertical, 6)
    .padding(.leading, 15)
    .frame(maxWidth: .infinity, alignment: .leading)
    .foregroundColor(.white)
    .background(Color.gray)
  }
}
struct RatingText: View {
  let rating: Product.Rating
  var body: some View {
    Text("rate: \(rating.rate, specifier: "%.1f"), count: \(rating.count)")
      .font(.body)
  }
}
struct TextView_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        BodyText(text: "body text")
        BigBoldText(text: "Big Bold Text")
      }
    }
}
