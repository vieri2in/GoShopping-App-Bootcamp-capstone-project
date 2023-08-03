//
//  CartUnitShowView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 6/21/23.
//

import SwiftUI
struct CartUnitShowView: View {
  @EnvironmentObject var userCartListVM: UserCartListViewModel
  let productsInCart: ProductsInCart
  var body: some View {
    HStack(spacing: 5) {
      HStack {
        AsyncImageCartUnitView(urlString: productsInCart.product.image)
        VStack(alignment: .leading) {
          Text(productsInCart.product.title)
          let priceStr = String(format: "%.2f", productsInCart.product.price)
          Text("$\(priceStr)")
            .bold()
          HStack(spacing: 24) {
            HStack(spacing: 12) {
              Button {
                userCartListVM.decrementQuantity(for: productsInCart)
              } label: {
                ButtonImageCartUnitView(systemName: (productsInCart.quantity == 0) ? "trash" : "minus")
              }
              .buttonStyle(.plain)
              .buttonStyle(.borderedProminent)
              Text("\(productsInCart.quantity)")
                .font(.caption)
              Button {
                userCartListVM.incrementQuantity(for: productsInCart)
              } label: {
                ButtonImageCartUnitView(systemName: "plus")
              }
              .buttonStyle(.plain)
            }
            Button {
              userCartListVM.deleteProductViewModel(for: productsInCart)
            } label: {
              DeleteButtonImageCartUnitView()
            }
            .buttonStyle(.plain)
          }
        }
      }
    }
  }
  struct CartUnitShowView_Previews: PreviewProvider {
    @State static var productsInCart =
    ProductsInCart(id: UUID(), product: Product.example, quantity: 6)
    static var previews: some View {
      CartUnitShowView(productsInCart: productsInCart)
        .environmentObject(UserCartListViewModel())
    }
  }
}
