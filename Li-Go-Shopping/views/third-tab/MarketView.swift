import SwiftUI
struct MarketView: View {
  @ObservedObject var modelDataManager: ProductsStore
  @State private var searchText = ""
  let columns: [GridItem] = [
    GridItem(.flexible(), spacing: 6),
    GridItem(.flexible(), spacing: 6)
  ]
  var body: some View {
    NavigationStack {
      ScrollView {
//        Text("This a market in the form of grid.")
//          .bold()
//          .frame(height: 150)
        LazyVGrid(
          columns: columns,
          alignment: .center,
          spacing: 10,
          pinnedViews: [.sectionHeaders]
        ) {
          Section(
            header:
              MarketHeaderText(text: "Electronics")
          ) {
            let electronicItems = modelDataManager.products
              .filter {$0.category == .electronics}
            ForEach(
              electronicItems
                .filter({
                  "\($0.title.lowercased())".contains(searchText.lowercased()) || searchText.isEmpty
                })
            ) { item in
              UnitView(product: item)
            }
          }
          Section(
            header:
              MarketHeaderText(text: "Jewelery")
          ) {
            let jewlItems = modelDataManager.products
              .filter {$0.category == .jewelery}
            ForEach(
              jewlItems
                .filter({
                  "\($0.title.lowercased())".contains(searchText.lowercased()) || searchText.isEmpty
                })
            ) { item in
              UnitView(product: item)
            }
          }
          Section(
            header:
              MarketHeaderText(text: "Men's Clothing")
          ) {
            let mscItems = modelDataManager.products
              .filter {$0.category == .mensClothing}
            ForEach(
              mscItems
                .filter({
                  "\($0.title.lowercased())".contains(searchText.lowercased()) || searchText.isEmpty
                })
            ) { item in
              UnitView(product: item)
            }
          }
          Section(
            header:
              MarketHeaderText(text: "Women's Clothing")
          ) {
            let wmscItems = modelDataManager.products
              .filter {$0.category == .womensClothing}
            ForEach(
              wmscItems
                .filter({
                  "\($0.title.lowercased())".contains(searchText.lowercased()) || searchText.isEmpty
                })
            ) { item in
              UnitView(product: item)
            }
          }
        }
      }
      .searchable(text: $searchText, prompt: "Search here...")

    }
    .navigationTitle("Market")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct MarketView_Previews: PreviewProvider {
  static var previews: some View {
    MarketView(modelDataManager: ProductsStore())
  }
}
