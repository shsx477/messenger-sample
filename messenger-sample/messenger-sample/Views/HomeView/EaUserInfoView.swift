import SwiftUI

struct EaUserInfoView: View {
  @ObservedObject var vm: EaUserInfoVM
  @State private var isPresented = false
  
  var body: some View {
    ZStack {
      // background
      Util.defaultBgColor
        .edgesIgnoringSafeArea(.all)
      
      vm.userData.backgroundImage.map {
        UIImage(data: $0).map {
          Image(uiImage: $0)
            .resizable()
            .edgesIgnoringSafeArea(.all)
        }
      }
      
      // controls
      VStack {
        ZStack {
          // for event when tapped
          Rectangle()
            .foregroundColor(.clear)
            .contentShape(Rectangle())
            .sheet(isPresented: $isPresented) {
              EaBackgroundHistoryView(vm: EaBackgroundHistoryVM(userData: self.vm.userData))
            }
            .onTapGesture {
              self.isPresented = true
            }
            
          VStack {
            TopMenuView()
            Spacer()
            ProfileView(userData: vm.userData)
          }
        }
        
        Divider()
          .background(Color.white)
        
        BottomMenuView()
      }
    }
  }
}

// top menu
private struct TopMenuView: View {
  var body: some View {
    HStack {
      EaCloseButton()
      Spacer()
      Image(systemName: Util.tempIconName).foregroundColor(.white)
      Image(systemName: Util.tempIconName).foregroundColor(.white)
      Image(systemName: Util.tempIconName).foregroundColor(.white)
    }
    .frame(height: EaHomeView.topMenuViewHeight)
    .padding(EaHomeView.topMenuViewPadding)
  }
}

// profile view
private struct ProfileView: View {
  var userData: EaUserModel
  @State private var isPresented = false
  
  var body: some View {
    VStack {
      EaProfileImage(imageData: userData.profileImage, size: 80)
      Text(userData.name)
        .foregroundColor(.white)
      Text(userData.message)
        .font(.system(size: 13))
        .foregroundColor(.white)
    }
    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    .sheet(isPresented: $isPresented) {
      EaProfileHistoryView(vm: EaProfileHistoryVM(userData: self.userData))
    }
    .onTapGesture {
      self.isPresented = true
    }
  }
}

// bottom menu
private struct BottomMenuView: View {
  var body: some View {
    HStack {
      Spacer()
      BottomMenuItemView(imageName: "bubble.left", title: "나와의 채팅")
      Spacer().frame(width: 20)
      BottomMenuItemView(imageName: "pencil", title: "프로필 편집")
      Spacer().frame(width: 20)
      BottomMenuItemView(imageName: "quote.bubble.fill", title: "카카오스토리")
      Spacer()
    }
    .frame(height: 100)
  }
}

// bottom menu item
private struct BottomMenuItemView: View {
  var imageName: String
  var title: String
  
  var body: some View {
    VStack {
      Image(systemName: imageName)
        .foregroundColor(.white)
      Text(title)
        .foregroundColor(.white)
    }
  }
}

struct EaUserInfoView_Previews: PreviewProvider {
  static var previews: some View {
    EaUserInfoView(vm: EaUserInfoVM(userData: EaUserModel.createTestData()))
  }
}
