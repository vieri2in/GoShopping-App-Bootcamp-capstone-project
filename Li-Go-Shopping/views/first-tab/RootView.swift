//
//  RootView.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/7/23.
//

import SwiftUI
struct RootView: View {
  @EnvironmentObject var networkMonitor: NetworkMonitor
  @ObservedObject var productsStore: ProductsStore
  @State var useFakeNetwork = false
  @State var downloader: any DataDownloadServiceProtocol = NetworkService()
  @State var isLoading = false
  @State var isShowingNoNetworkView = false
  @State var hasDownloaded = false
  var body: some View {
    List {
      Toggle(isOn: $useFakeNetwork) {
        Text("Use Fake Network")
      }
      HStack {
        Spacer()
        Button {
          if networkMonitor.isConnected {
            Task {
              isLoading.toggle()
              await productsStore.downloadProductsTapped(downloader: downloader)
              isLoading.toggle()
              hasDownloaded = true
            }
          } else {
            isShowingNoNetworkView.toggle()
          }
        } label: {
          HStack(spacing: 15, content: {
            Image(systemName: hasDownloaded ? "checkmark.circle" : "square.and.arrow.down")
              .resizable()
              .frame(width: Constants.General.iconViewLength, height: Constants.General.iconViewLength)
              .foregroundColor(hasDownloaded ? .green : .blue)
              .animation(.spring(), value: hasDownloaded)
            Text(isLoading ? "Loading Data..." : "Make GET Request")
              .foregroundColor(.blue)
          })
        }
        Spacer()
      }
      Section(
        header:
          HStack {
            Text("Electronics")
            Image(systemName: "ipod")
          }
          .foregroundColor(.blue)
      ) {
        let electrocnics = productsStore.products
          .filter {$0.category == .electronics}
        ForEach(electrocnics) { elctronic in
          NavigationLink(value: elctronic) {
            ItemRowView(product: elctronic)
          }
        }
        .onDelete(perform: productsStore.deleteProduct(indexSet:))
        .onMove(perform: productsStore.moveProduct(a:b:))
      }
      Section(
        header:
          HStack {
            Text("Jewelery")
            Image(systemName: "crown.fill")
          }
          .foregroundColor(.blue)
      ) {
        let jewlItems = productsStore.products.filter {$0.category == .jewelery}
        ForEach(jewlItems) { jewlItem in
          NavigationLink(value: jewlItem) {
            ItemRowView(product: jewlItem)
          }
        }
        .onDelete(perform: productsStore.deleteProduct(indexSet:))
        .onMove(perform: productsStore.moveProduct(a:b:))
      }
      Section(
        header:
          HStack {
            Text("Men's Clothing")
            Image(systemName: "tshirt.fill")
          }
          .foregroundColor(.blue)
      ) {
        let msc = productsStore.products
          .filter {$0.category == .mensClothing}
        ForEach(msc) { ms in
          NavigationLink(value: ms) {
            ItemRowView(product: ms)
          }
        }
        .onDelete(perform: productsStore.deleteProduct(indexSet:))
        .onMove(perform: productsStore.moveProduct(a:b:))
      }
      Section(
        header:
          HStack {
            Text("Women's Clothing")
            Image(systemName: "eyebrow")
          }
          .foregroundColor(.blue)
      ) {
        let wmsc = productsStore.products
          .filter {$0.category == .womensClothing}
        ForEach(wmsc) { cloth in
          NavigationLink(value: cloth) {
            ItemRowView(product: cloth)
          }
        }
        .onDelete(perform: productsStore.deleteProduct(indexSet:))
        .onMove(perform: productsStore.moveProduct(a:b:))
      }
    }
    .onAppear(perform: {
      productsStore.saveBinaryProducts()
      productsStore.savePlistProducts()
    })
    .onChange(of: useFakeNetwork, perform: { newValue in
      self.downloader = newValue ? MockNetworkService() : NetworkService()
    })
    .fullScreenCover(isPresented: $isShowingNoNetworkView, content: {
      NoNetworkView()
    })
    .navigationTitle("Home View")
    .navigationBarTitleDisplayMode(.inline)
    .listStyle(.grouped)
    .toolbar {
      EditButton()
    }
  }
}
struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView(productsStore: ProductsStore())
  }
}
