import Foundation

class EaTextEditVM: ObservableObject {
  @Published var text: String
  
  private let closeAction: () -> Void
  
  
  init(text: String, closeAction: @escaping () -> Void) {
    self.text = text
    self.closeAction = closeAction
  }
  
  
  func close() {
    self.closeAction()
  }
}
