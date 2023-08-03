//
//  SecondTabView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/6/23.
//

import SwiftUI

struct CartTabView: View {
  @EnvironmentObject var userCartListVM: UserCartListViewModel
  @State var isShowingCheckOutAlert = false
  var body: some View {
    let totalStr = String(format: "%.2f", userCartListVM.subTotal)
    List {
      HStack {
        Text("Subtotol: $\(totalStr)")
          .bold()
          .font(.title3)
      }
      HStack {
        Spacer()
        Button(action: {
          isShowingCheckOutAlert.toggle()
        }, label: {
          Text("Proceed to checkout \(userCartListVM.totalNumber) items")
            .padding(.vertical, 6)
            .padding(.horizontal, 24)
        })
        .foregroundColor(.white)
        .background(Color.yellow)
        .cornerRadius(15)
        .buttonStyle(.borderless)
        Spacer()
      }
      ForEach(userCartListVM.productQuantities) { productsInCart in
        CartUnitShowView(productsInCart: productsInCart)
      }
    }
    .navigationTitle("Cart")
    .navigationBarTitleDisplayMode(.inline)
    .listStyle(.grouped)
    .alert("Order comfirmed",
           isPresented: $isShowingCheckOutAlert, actions: {},
           message: {Text("Your total was \(String(format: "%.2f", userCartListVM.subTotal)) - thank you!")})
  }
  struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
      CartTabView()
        .environmentObject(UserCartListViewModel())
    }
  }
}
