import SwiftUI

struct EaProfileHistoryView: View {
  @ObservedObject var vm: EaProfileHistoryVM
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      
      ZStack() {
        // image
        ZStack {
          UIImage(data: EaConstant.tempProfileImageData).map {
            Image(uiImage: $0)
              .resizable()
          }
          
          vm.userData.profileImage.map {
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
}

private struct TopMenuView: View {
  var body: some View {
    HStack {
      EaCloseButton()
      Spacer()
      Utils.creatTempImage()
    }
    .frame(height: EaHomeView.topMenuViewHeight)
    .paddingTopMenuForSheet()
  }
}

struct EaProfileImageHistoryView_Previews: PreviewProvider {
  static var previews: some View {
    EaProfileHistoryView(vm: EaProfileHistoryVM(userData: EaUserModel.createTestData()))
  }
}
