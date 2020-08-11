import Foundation
import SwiftUI

class EaProfileEditVM: ObservableObject {
  @Published var userData: EaUserModel
  @Published var isShowEditTextView: Bool = false
  
  lazy var textEditVM = EaTextEditVM(closeAction: closeEditTextView)
  
  private let closeAction: (Bool, EaUserModel) -> Void
  private var setKeyPath: WritableKeyPath<EaUserModel, String>?
  
  
  init(userData: EaUserModel, closeAction: @escaping (Bool, EaUserModel) -> Void) {
    self.userData = userData
    self.closeAction = closeAction
  }
  
  
  func onNameTapGesture() {
    self.setKeyPath = \EaUserModel.name
    self.textEditVM.text = userData.name
    self.textEditVM.maxLength = EaConstant.nameMaxLength
    self.isShowEditTextView = true
  }
  
  func onStateMessageTapGesture() {
    self.setKeyPath = \EaUserModel.message
    self.textEditVM.maxLength = EaConstant.stateMessageMaxLength
    self.textEditVM.text = userData.message
    self.isShowEditTextView = true
  }
  
  func closeEditTextView(isApply: Bool, text: String) {
    if isApply, let setKeyPath = self.setKeyPath {
      self.userData[keyPath: setKeyPath] = text
    }
    
    self.isShowEditTextView = false
  }

  func closeSelf(isApply: Bool) {
    self.closeAction(isApply, self.userData)
  }
}
