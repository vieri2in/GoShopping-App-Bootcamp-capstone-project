//
//  HomeDetailView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/7/23.
//
import SwiftUI
struct HomeDetailView: View {
  @EnvironmentObject var userCartListVM: UserCartListViewModel
  let product: Product
  @State private var quantity = 1
  @State private var isShowAddedToCartAlert = false
  var body: some View {
    let priceStr = String(format: "%.2f", product.price)
    ScrollView {
      VStack {
        AsyncImageListUnitView(urlString: product.image)
        TitleText(text: product.title)
        HStack {
          Text("$\(priceStr)")
            .bold()
          RatingText(rating: product.rating)
        }
        BodyText(text: product.description)
        HStack(spacing: 24) {
          HStack(spacing: 12) {
            Button {
              guard quantity > 0 else {
                return
              }
              quantity -= 1
            } label: {
              ButtonImageCartUnitView(systemName: (quantity == 0) ? "trash" : "minus")
            }
            .buttonStyle(.plain)
            .buttonStyle(.borderedProminent)
            Text("\(quantity)")
              .font(.caption)
            Button {
              quantity += 1
            } label: {
              ButtonImageCartUnitView(systemName: "plus")
            }
            .buttonStyle(.plain)
          }
          Button {
            userCartListVM.addProductViewModel(for: ProductsInCart(id: UUID(), product: product, quantity: quantity))
            isShowAddedToCartAlert.toggle()
          } label: {
            Text("Purchase this item")
              .padding(.horizontal, 6)
          }
          .buttonBorderShape(.capsule)
          .buttonStyle(.borderedProminent)
        }
      }
      .navigationTitle(product.title)
      .alert("Added to cart",
             isPresented: $isShowAddedToCartAlert, actions: {},
             message: {})
    }
  }
}
struct HomeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HomeDetailView(product: Product.example)
  }
}
