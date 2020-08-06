import Foundation

class EaProfileHistoryVM: ObservableObject {
  @Published var userData: EaUserModel
  
  
  init(userData: EaUserModel) {
    self.userData = userData
  }
}
