import SwiftUI

struct EaTabMainView: View {
  var body: some View {
    TabView {
      EaHomeView(vm: EaHomeVM())
        .tabItem {
          self.CreateTabBarImage(systemName: "person")
      }
      EaChatView()
        .tabItem {
          self.CreateTabBarImage(systemName: "bubble.left")
      }
      EaSharpView()
        .tabItem {
          self.CreateTabBarImage(systemName: "number")
      }
      EaConfigView()
        .tabItem {
          self.CreateTabBarImage(systemName: "gear")
      }
    }
//    .accentColor(.white)
  }
  
  private func CreateTabBarImage(systemName: String) -> some View {
    Image(systemName: systemName)
      .setSize(size: 25)
  }
}

struct EaMainTabView_Previews: PreviewProvider {
  static var previews: some View {
    EaTabMainView()
  }
}
