import Foundation

class EaUserInfoVM: ObservableObject {
  @Published var userData: EaUserModel
  
  
  init(userData: EaUserModel) {
    self.userData = userData
  }
}
