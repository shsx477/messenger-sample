import SwiftUI

struct EaProfileInfoView: View {
  static let bottomMenuHeight: CGFloat = 100
  static let profileTextHeight: CGFloat = 70
  static let nameFontSize: CGFloat = 18
  static let stateMessageFontSize: CGFloat = 15
  static var profileImageBottomPadding: CGFloat {
    EaProfileInfoView.bottomMenuHeight + EaProfileInfoView.profileTextHeight + 10 }
  
  @ObservedObject var vm: EaProfileInfoVM

  var body: some View {
    ZStack {
      // background
      EaConstant.defaultBgColor
        .edgesIgnoringSafeArea(.all)
      
      vm.userData.backgroundImage.map {
        UIImage(data: $0).map {
          Image(uiImage: $0)
            .resizable()
            .edgesIgnoringSafeArea(.all)
        }
      }
      
      // for event when tapped
      if !vm.isShowProfileEditor {
        VStack {
          Rectangle()
            .foregroundColor(.clear)
            .contentShape(Rectangle())
            .sheet(isPresented: $vm.isBgPresented) { self.vm.onBgSheet() }
            .onTapGesture { self.vm.onBgTapGesture() }
          
          Spacer()
            .frame(height: EaProfileInfoView.bottomMenuHeight)
        }
      }
      
      VStack {
        Spacer()
        
        EaProfileImage(imageData: vm.userData.profileImage, size: EaConstant.profileImageSize)
          .sheet(isPresented: $vm.isProfilePresented) { self.vm.onProfileSheet() }
          .onTapGesture { self.vm.onProfileTapGesture() }
          .padding(EdgeInsets(top: 0,
                              leading: 0,
                              bottom: EaProfileInfoView.profileImageBottomPadding,
                              trailing: 0))
      }
      
      if !vm.isShowProfileEditor {
        // controls
        VStack(spacing: 0) {
          VStack {
            TopMenuView()
            
            Spacer()
            
            VStack {
              Text(vm.userData.name)
                .font(.system(size: EaProfileInfoView.nameFontSize))
                .foregroundColor(.white)
              Text(vm.userData.message)
                .font(.system(size: EaProfileInfoView.stateMessageFontSize))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
            }
            .frame(height: EaProfileInfoView.profileTextHeight, alignment: .top)
          }
          
          Divider()
            .background(Color.white)
          
          BottomMenuView()
        }
      } else {
        EaProfileEditView(vm: EaProfileEditVM(userData: self.vm.userData) { isApply, newUserData in
          self.vm.closeProfileEditor(isApply: isApply, newUserData: newUserData)
        })
      }
    }
    .environmentObject(self.vm)
  }
}

// top menu
private struct TopMenuView: View {
  var body: some View {
    HStack {
      EaCloseButton()
      Spacer()
      Utils.creatTempImage()
      Utils.creatTempImage()
      Utils.creatTempImage()
    }
    .frame(height: EaHomeView.topMenuViewHeight)
    .paddingTopMenuForSheet()
  }
}

// bottom menu
private struct BottomMenuView: View {
  @EnvironmentObject var vm: EaProfileInfoVM
  
  var body: some View {
    HStack {
      Spacer()
      
      BottomMenuItemView(imageName: "bubble.left", title: "나와의 채팅") {
        
      }
      
      Spacer()
      
      BottomMenuItemView(imageName: "pencil", title: "프로필 편집") {
        self.vm.showProfileEditor()
      }
      
      Spacer()
      
      BottomMenuItemView(imageName: "quote.bubble.fill", title: "카카오스토리") {
        
      }
      
      Spacer()
    }
    .frame(height: EaProfileInfoView.bottomMenuHeight)
  }
}

// bottom menu item
private struct BottomMenuItemView: View {
  var imageName: String
  var title: String
  var action: () -> Void
  
  var body: some View {
    VStack {
      Image(systemName: imageName)
        .foregroundColor(.white)
      
      Text(title)
        .font(.system(size: 15))
        .foregroundColor(.white)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
    .onTapGesture {
      withAnimation(.linear(duration: 0.5)) {
        self.action()
      }
    }
    .animation(.default)
  }
}

struct EaUserInfoView_Previews: PreviewProvider {
  static var previews: some View {
    EaProfileInfoView(vm: EaProfileInfoVM(userData: EaUserModel.createTestData()))
  }
}
