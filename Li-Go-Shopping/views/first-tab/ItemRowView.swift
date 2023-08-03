//
//  ItemRowView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 6/22/23.
//

import SwiftUI

struct ItemRowView: View {
  let product: Product
  var body: some View {
    let price = String(format: "%.2f", product.price)
    var stars: Int {
      guard product.rating.rate.rounded() > 0  else {
        return 1
      }
      return Int(product.rating.rate.rounded())
    }
    let vals = [Int](1...5)
    HStack {
      AsyncThumbNailImageView(urlString: product.image)
      VStack(alignment: .leading) {
        Text(product.title)
        HStack {
          Text("$\(price)")
          Spacer()
          HStack(spacing: -2) {
            ForEach(vals, id: \.self) { val in
              Image(systemName: "star")
                .imageScale(.small)
                .fontWeight(.black)
                .foregroundColor((val > stars) ? .gray : .yellow)
            }
          }
        }
      }
    }
  }
}

struct ItemRowView_Previews: PreviewProvider {
  static var previews: some View {
    ItemRowView(product: Product.example)
  }
}
