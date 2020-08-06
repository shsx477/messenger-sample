import Foundation
import SwiftUI

class EaHomeVM: ObservableObject {
  @Published var userData: EaUserModel
  @Published var friendDatas: [EaFriendModel]
  
  
  init() {
    userData = EaUserModel.createTestData()
    friendDatas = EaFriendModel.createTestDatas()
  }
}
