import Foundation
import SwiftUI
import Combine

class EaHomeVM: ObservableObject {
  @Published var userData: EaUserModel
  @Published var friendDatas: [EaFriendModel]
  @Published var isUserPresented: Bool = false
  
  private var cancellableSet: Set<AnyCancellable> = []
  
  private var profileInfoVM: EaProfileInfoVM
  
  
  init(userData: EaUserModel) {
    self.userData = userData
    self.friendDatas = EaFriendModel.createTestDatas()
    
    self.profileInfoVM = EaProfileInfoVM(userData: userData)
    
    self.profileInfoVM.$userData.self
      .assign(to: \.userData, on: self)
      .store(in: &cancellableSet)
  }
  
  
  func onUserSheet() -> some View {
    return EaProfileInfoView(vm: self.profileInfoVM)
  }
  
  func onUserTapGesture() {
    self.isUserPresented = true
  }
}
