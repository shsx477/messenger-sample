import Foundation
import SwiftUI

class EaHomeVM: ObservableObject {
  @Published var userData: EaUserModel
  @Published var friendDatas: [EaFriendModel]
  @Published var isUserPresented: Bool = false
  
  
  init() {
    self.userData = EaUserModel.createTestData()
    self.friendDatas = EaFriendModel.createTestDatas()
  }
  
  
  func onUserSheet() -> some View {
    EaProfileInfoView(vm: EaProfileInfoVM(userData: self.userData))
  }
  
  func onUserTapGesture() {
    self.isUserPresented = true
  }
}
