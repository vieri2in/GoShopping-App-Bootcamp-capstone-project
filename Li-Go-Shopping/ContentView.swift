import SwiftUI

struct ContentView: View {
  @EnvironmentObject var userCartListVM: UserCartListViewModel
  @StateObject var navagationStateManager = NavigationStateManager(selection: nil)
  @StateObject private var modelDataManager = ProductsStore()
  @State var shouldShowOnBoarding: Bool = true
  var body: some View {
    if shouldShowOnBoarding {
      OnBoardingView(shouldShowOnBoarding: $shouldShowOnBoarding)
    } else {
      VStack {
        TabView(selection: $navagationStateManager.selection) {
          HomeTabView(modelDataManager: modelDataManager, navigationStateManager: navagationStateManager)
            .tabItem {
              Label("Home", systemImage: "house")
            }
            .tag(1)
          MarketView(modelDataManager: modelDataManager)
            .tabItem {
              Label("Market", systemImage: "square.grid.3x3.middle.filled")
            }
            .tag(2)
          CartTabView()
            .tabItem {
              Label("Cart", systemImage: "cart.fill")
            }
            .tag(3)
            .badge(userCartListVM.totalNumber)
        }
      }
    }
  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(navagationStateManager: NavigationStateManager(selection: nil))
  }
}
