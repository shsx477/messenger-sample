import SwiftUI

private let rowInsets = EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)

struct EaHomeView: View {
  static let topMenuViewHeight: CGFloat = 25
  static let topMenuViewPadding: CGFloat = 20
  
  @ObservedObject var vm: EaHomeVM
  
  var body: some View {
    VStack {
      HStack {
        Text("친구").font(.system(size: 25))
        Spacer()
        HStack {
          Image(systemName: Util.tempIconName)
          Image(systemName: Util.tempIconName)
          Image(systemName: Util.tempIconName)
          Image(systemName: Util.tempIconName)
        }
      }
      .frame(height: 30)
      
      EaUserListView(userData: $vm.userData, friendDatas: $vm.friendDatas)
    }
    .padding(10)
  }
}

// total user list
private struct EaUserListView: View {
  @Binding var userData: EaUserModel
  @Binding var friendDatas: [EaFriendModel]
  @State private var show: Bool = false
  
  
  var body: some View {
    List {
      // user
      EaUserRowView(userData: $userData)

      // divider
      Divider()
        .frame(height: 1)
        .foregroundColor(Color.gray)
        .listRowInsets(rowInsets)
      
      // friend count
      EaFriendCountRowView(friendCount: friendDatas.count)
      
      // friends
      ForEach(friendDatas) { friend in
        EaFriendRowView(friend: friend)
      }
    }
    .environment(\.defaultMinListRowHeight, 1)
    .onAppear {
      UITableView.appearance().separatorStyle = .none
    }
  }
}

// user Row
private struct EaUserRowView: View {
  @State private var isPresented: Bool = false
  @Binding var userData: EaUserModel
  
  var body: some View {
    VStack {
      HStack {
        EaProfileImage(imageData: userData.profileImage, size: 50)
        
        VStack {
          HStack {
            Text(userData.name)
            Spacer()
          }

          HStack {
            Text(userData.message)
              .font(.system(size: 13))
              .foregroundColor(Color.gray)
            Spacer()
          }
        }
        
        Spacer()
      }
    }
    .contentShape(Rectangle())  // for event when tapped
    .listRowInsets(rowInsets)
    .sheet(isPresented: $isPresented) {
      EaUserInfoView(vm: EaUserInfoVM(userData: self.userData))
    }
    .onTapGesture {
      self.isPresented = true
    }
  }
}

// friend count row
private struct EaFriendCountRowView: View {
  var friendCount: Int
  
  var body: some View {
    Text("친구 \(friendCount)")
      .font(.system(size: 13))
      .foregroundColor(Color.gray)
      .listRowInsets(rowInsets)
  }
}

// friend Row
private struct EaFriendRowView: View {
  let friend: EaFriendModel
  
  var body: some View {
    HStack {
      EaProfileImage(imageData: friend.profileImage)
      
      VStack {
        HStack {
          Text(friend.name)
          Spacer()
        }
        
        HStack {
          Text(friend.message)
            .font(.system(size: 13))
            .foregroundColor(Color.gray)
          Spacer()
        }
      }
    }
  .listRowInsets(rowInsets)
  }
}

struct EaUserView_Previews: PreviewProvider {
  static var previews: some View {
    EaHomeView(vm: EaHomeVM())
  }
}
