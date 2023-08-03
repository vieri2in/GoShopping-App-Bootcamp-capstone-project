//  UnitView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/7/23.
//

import SwiftUI

struct UnitView: View {
  let product: Product
  var body: some View {
    VStack {
      AsyncImageUnitView(urlString: product.image)
      BodyText(text: product.title)
    }
  }
}

// struct UnitView_Previews: PreviewProvider {
//  static var previews: some View {
//    UnitView(product: Product(
//      title: "Water Doodle Mat",
//      price: 24.99, color: "Multicolor",
//      size: "39.37 x 27.56 x 1.18 inches",
//      category: .electronics,
//      imageName: "Water-Doodle-MatImage",
//      description: "aa"))
//  }
// }
