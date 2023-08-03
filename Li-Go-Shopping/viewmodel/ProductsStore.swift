//
//  ModelDataManager.swift
//  Li-Go-Shopping
//
//  Created by bin li on 5/7/23.
//

import Foundation
class ProductsStore: ObservableObject {
  let productsBinaryURL = URL(
    fileURLWithPath: "products",
    relativeTo: FileManager.documentsDirectoryURL)
    .appendingPathExtension("bin")
  let productsPlistURL = URL(
    fileURLWithPath: "products",
    relativeTo: FileManager.documentsDirectoryURL)
    .appendingPathExtension("plist")
  @Published var products: [Product] = []
  init() {
    // swiftlint:disable line_length
    products = [
      Product(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95,
              description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
              category: .mensClothing,
              image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
              rating: Product.Rating(rate: 3.9, count: 120)),
      Product(id: 2, title: "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
              price: 695,
              description: "From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.",
              category: .jewelery,
              image: "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
              rating: Product.Rating(rate: 4.6, count: 400)),
      Product(id: 3, title: "WD 2TB Elements Portable External Hard Drive - USB 3.0 ",
              price: 64,
              description: "USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system",
              category: .electronics,
              image: "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
              rating: Product.Rating(rate: 3.3, count: 203)),
      Product(id: 4, title: "Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin",
              price: 599,
              description: "21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz",
              category: .electronics,
              image: "https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg",
              rating: Product.Rating(rate: 2.9, count: 250)),
      Product(id: 5, title: "BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats",
              price: 56.99,
              description: "Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates",
              category: .womensClothing,
              image: "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
              rating: Product.Rating(rate: 2.6, count: 235))
    ]
  }
  // swiftlint:enable line_length
  init(products: [Product]) {
    self.products = products
  }
  //
  func deleteProduct(indexSet: IndexSet) {
    products.remove(atOffsets: indexSet)
  }
  func moveProduct(a: IndexSet, b: Int) {
    products.move(fromOffsets: a, toOffset: b)
  }
  //
  func loadPropertyListProducts() {
    let decoder = PropertyListDecoder()
    do {
      let productsData = try Data(contentsOf: productsPlistURL)
      products = try decoder.decode([Product].self, from: productsData)
    } catch let error {
      print(error)
    }
  }
  func saveBinaryProducts() {
    print(FileManager.documentsDirectoryURL)
    let encoder = PropertyListEncoder()
    encoder.outputFormat = .xml
    do {
      //
      let productsData = try encoder.encode(products)
      let dataAsPropertyList = try PropertyListSerialization.data(
        fromPropertyList: productsData,
        format: .binary,
        options: 0)
      try dataAsPropertyList.write(to: productsBinaryURL)
      print("File saved successfully.")
    } catch {
      print("Error while saving the file: \(error.localizedDescription)")
    }
  }
  func savePlistProducts() {
    //    print(FileManager.documentsDirectoryURL)
    let encoder = PropertyListEncoder()
    encoder.outputFormat = .xml
    do {
      let productsData = try encoder.encode(products)
      try productsData.write(to: productsPlistURL, options: .atomicWrite)
    } catch let error {
      print(error)
    }
  }
  func decodeData(from data: Data) throws -> [Product] {
    let decoder = JSONDecoder()
    var products: [Product] = []
    do {
      products = try decoder.decode([Product].self, from: data)
    } catch let DecodingError.dataCorrupted(context) {
      print(context)
    } catch let DecodingError.keyNotFound(key, context) {
      print("Key \(key) not found: \(context.debugDescription)")
      print("codingPath: \(context.codingPath)")
    } catch let DecodingError.valueNotFound(value, context) {
      print("Value \(value) not found: \(context.debugDescription)")
      print("codingPath: \(context.codingPath)")
    } catch let DecodingError.typeMismatch(type, context) {
      print("Type \(type) mismatch: \(context.debugDescription)")
      print("codingPath: \(context.codingPath)")
    } catch {
      print("error: \(error)")
    }
    return products
  }
  func downloadProductsTapped(downloader: DataDownloadServiceProtocol) async {
    let url = URL(string: "https://fakestoreapi.com/products")!
    do {
      let newData = try await downloader.getData(from: url)
      let newProducts = try decodeData(from: newData)
      await MainActor.run {
        products = newProducts
      }
    } catch let error {
      print(error)
    }
  }
}
