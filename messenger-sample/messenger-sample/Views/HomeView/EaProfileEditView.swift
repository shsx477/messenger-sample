import SwiftUI

private let iconSize: CGFloat = 25
private var profileBottomPadding: CGFloat { EaProfileInfoView.profileImageBottomPadding }

struct EaProfileEditView: View {
  @ObservedObject var vm: EaProfileEditVM

  @ViewBuilder
  var body: some View {
    ZStack {
      VStack {
        TopMenuView()
        Spacer()
        ProfileView()
        BottomMenuView()
      }
      
      // profile rectangle for event
      ProfileImageRectangleView()
      
      // camera icon in the center
      CameraIconView()
      
      // text editing view
      if self.vm.isShowEditTextView {
        EaTextEditView(vm: vm.textEditVM)
      }
    }
    .environmentObject(self.vm)
  }
}

private struct TopMenuView: View {
  @EnvironmentObject var vm: EaProfileEditVM
  
  var body: some View {
    HStack {
      EaCancelButton() {
        withAnimation(.linear(duration: 0.5)) {
          self.vm.closeSelf(isApply: false)
        }
      }
      
      Spacer()
      
      EaTrashButton() {
        print("")
      }
      
      Spacer()
      
      EaOkButton(title: "완료") {
        self.vm.closeSelf(isApply: true)
      }
    }
    .paddingTopMenuForSheet()
  }
}

private struct ProfileView: View {
  @EnvironmentObject var vm: EaProfileEditVM
  
  var body: some View {
    VStack {
      TextView(text: $vm.userData.name, fontSize: EaProfileInfoView.nameFontSize)
        .onTapGesture(perform: self.vm.onNameTapGesture)
      
      TextView(text: $vm.userData.message, fontSize: EaProfileInfoView.stateMessageFontSize)
        .onTapGesture(perform: self.vm.onStateMessageTapGesture)
    }
    .frame(height: EaProfileInfoView.profileTextHeight, alignment: .bottom)
  }
}

private struct BottomMenuView: View {
  private let imageNames: [String] = ["camera.circle.fill",
                                      "music.note.list",
                                      "aspectratio",
                                      "smiley",
                                      "square.and.pencil",
                                      "bolt",
                                      "calendar"]
  
  var body: some View {
    VStack {
      Spacer()
      
      HStack {
        Spacer()
        
        ForEach(imageNames, id: \.self) { imageName in
          Image(systemName: imageName)
            .resizable()
            .frame(width: iconSize, height: iconSize)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
        }
        
        Spacer()
      }
    }
    .frame(height: EaProfileInfoView.bottomMenuHeight)
  }
}

private struct ProfileImageRectangleView: View {
  var body: some View {
    VStack {
      Spacer()
      Rectangle()
        .frame(width: EaConstant.profileImageSize, height: EaConstant.profileImageSize)
        .clipShape(EaProfileImage.ClippingShape())
        .foregroundColor(Color.clear)
        .contentShape(Rectangle())
        .padding(EdgeInsets(top: 0,
                            leading: 0,
                            bottom: profileBottomPadding,
                            trailing: 0))
        .onTapGesture {
          print("clicked")
      }
    }
  }
}

private struct CameraIconView: View {
  var body: some View {
    VStack {
      Spacer()
      
      ZStack {
        Circle()
          .frame(width: iconSize, height: iconSize)
          .foregroundColor(.black)

        Image(systemName: "camera.circle.fill")
          .resizable()
          .frame(width: iconSize, height: iconSize)
          .foregroundColor(Color.white)
      }
      .padding(EdgeInsets(top: 0,
                          leading: 0,
                          bottom: profileBottomPadding,
                          trailing: 0))
      .alignmentGuide(HorizontalAlignment.center) { _ in -60 }
    }
  }
}

private struct TextView: View {
  @Binding var text: String
  let fontSize: CGFloat
  
  var body: some View {
    VStack {
      ZStack {
        Text(text)
          .foregroundColor(Color.white)
          .font(.system(size: fontSize))
        
        HStack {
          Spacer()
          Image(systemName: "pencil")
            .foregroundColor(Color.white)
        }
      }

      Divider()
        .background(Color.white)
    }
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
  }
}

struct EaUserEditView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.blue.edgesIgnoringSafeArea(.all)
      EaProfileEditView(vm: EaProfileEditVM(userData: EaUserModel.createTestData()) { isApply, newUserData in
        print("close")
      })
    }
  }
}
