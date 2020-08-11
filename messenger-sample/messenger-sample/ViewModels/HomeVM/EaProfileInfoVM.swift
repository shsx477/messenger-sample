import Foundation
import SwiftUI

class EaProfileInfoVM: ObservableObject {
  @Published var userData: EaUserModel
  @Published var isBgPresented: Bool = false
  @Published var isProfilePresented: Bool = false
  @Published var isShowProfileEditor: Bool = false
  
  
  init(userData: EaUserModel) {
    self.userData = userData
  }
  
  
  func onBgSheet() -> some View {
    EaBackgroundHistoryView(vm: EaBackgroundHistoryVM(userData: self.userData))
  }
  
  func onBgTapGesture() {
    self.isBgPresented = true
  }
  
  func onProfileSheet() -> some View {
    EaProfileHistoryView(vm: EaProfileHistoryVM(userData: self.userData))
  }
  
  func onProfileTapGesture() {
    self.isProfilePresented = true
  }
  
  func showProfileEditor() {
    self.isShowProfileEditor = true
  }
  
  func closeProfileEditor(isApply: Bool, newUserData: EaUserModel) {
    if isApply {
      self.userData = newUserData
    }
    
    self.isShowProfileEditor = false
  }
}
