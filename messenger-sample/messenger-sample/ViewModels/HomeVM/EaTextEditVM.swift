import Foundation
import UIKit

class EaTextEditVM: ObservableObject {
  @Published var text: String = "" {
    didSet {
      self.textCount = self.text.count
    }
  }
  @Published var textCount: Int = 0
  @Published var maxLength: Int = 0
  
  private let closeAction: (Bool, String) -> Void
  
  
  init(closeAction: @escaping (Bool, String) -> Void) {
    self.closeAction = closeAction
  }
  
  
  func clearText() {
    self.text = ""
  }
  
  func close(isApply: Bool) {
    UIApplication.shared.endEditing()
    self.closeAction(isApply, self.text)
  }
}
