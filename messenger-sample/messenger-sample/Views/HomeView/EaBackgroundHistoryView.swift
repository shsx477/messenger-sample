import SwiftUI

struct EaBackgroundHistoryView: View {
  @ObservedObject var vm: EaBackgroundHistoryVM
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      // background image
      ZStack {
        Util.defaultBgColor
          .edgesIgnoringSafeArea(.all)
        
        vm.userData.backgroundImage.map {
          UIImage(data: $0).map {
            Image(uiImage: $0)
              .resizable()
              
          }
        }
      }
      .aspectRatio(contentMode: .fit)
      
      VStack {
        TopMenuView()
        Spacer()
      }
    }
  }
}

private struct TopMenuView: View {
  var body: some View {
    HStack {
      EaCloseButton()
      Spacer()
      Image(systemName: Util.tempIconName).foregroundColor(.white)
    }
    .frame(height: EaHomeView.topMenuViewHeight)
    .padding(EaHomeView.topMenuViewPadding)
  }
}

struct EaBackgroundHistoryView_Previews: PreviewProvider {
  static var previews: some View {
    EaBackgroundHistoryView(vm: EaBackgroundHistoryVM(userData: EaUserModel.createTestData()))
  }
}
