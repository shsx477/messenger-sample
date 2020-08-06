import Foundation

class EaBackgroundHistoryVM: ObservableObject {
  @Published var userData: EaUserModel
  
  
  init(userData: EaUserModel) {
    self.userData = userData
  }
}
