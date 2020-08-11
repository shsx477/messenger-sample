import SwiftUI

private let rowInsets = EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)

struct EaHomeView: View {
  static let topMenuViewHeight: CGFloat = 25
  
  @ObservedObject var vm: EaHomeVM
  
  var body: some View {
    VStack {
      HStack {
        Text("친구").font(.system(size: 25))
        Spacer()
        HStack {
          Utils.creatTempImage()
          Utils.creatTempImage()
          Utils.creatTempImage()
          Utils.creatTempImage()
        }
      }
      .frame(height: 30)
      
      EaUserListView()
    }
    .padding(10)
    .environmentObject(self.vm)
  }
}

// total user list
private struct EaUserListView: View {
  @EnvironmentObject var vm: EaHomeVM

  var body: some View {
    List {
      // user
      EaUserRowView()

      // divider
      Divider()
        .frame(height: 1)
        .foregroundColor(Color.gray)
        .listRowInsets(rowInsets)
      
      // friend count
      EaFriendCountRowView(friendCount: vm.friendDatas.count)
      
      // friends
      ForEach(vm.friendDatas) { friend in
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
  @EnvironmentObject var vm: EaHomeVM
  
  var body: some View {
    VStack {
      HStack {
        EaProfileImage(imageData: vm.userData.profileImage, size: 50)
        
        VStack {
          HStack {
            Text(vm.userData.name)
            Spacer()
          }

          HStack {
            Text(vm.userData.message)
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
    .sheet(isPresented: $vm.isUserPresented) { self.vm.onUserSheet() }
    .onTapGesture { self.vm.onUserTapGesture() }
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
