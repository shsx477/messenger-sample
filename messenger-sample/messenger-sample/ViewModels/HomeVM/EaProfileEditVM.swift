import Foundation
import SwiftUI

class EaProfileEditVM: ObservableObject {
  @Published var userData: EaUserModel
  
  private let closeAction: () -> Void
  
  
  init(userData: EaUserModel, closeAction: @escaping () -> Void) {
    self.userData = userData
    self.closeAction = closeAction
  }
  
  
  func closeSelf() {
    self.closeAction()
  }
}
