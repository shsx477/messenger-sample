import Foundation
import SwiftUI
import Combine

struct EaKeyboardAwareModifier: ViewModifier {
  @State private var keyboardHeight: CGFloat = 0
  
  private var keyboardHeightPublisher: AnyPublisher<CGFloat, Never> {
    let param1 = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
      .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue }
      .map { $0.cgRectValue.height }
    
    let param2 = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
      .map { _ in CGFloat(0) }
    
    return Publishers.Merge(param1, param2).eraseToAnyPublisher()
  }
  
  func body(content: Content) -> some View {
    content
      .padding(.bottom, keyboardHeight)
      .onReceive(keyboardHeightPublisher) { self.keyboardHeight = $0 }
  }
}
