import Foundation
import SwiftUI

extension View {
  func paddingTopMenuForSheet() -> some View {
    let pad: CGFloat = 20
    return padding(EdgeInsets(top: pad, leading: pad, bottom: pad, trailing: pad))
  }
  
  func keyboardAwarePadding() -> some View {
    ModifiedContent(content: self, modifier: EaKeyboardAwareModifier())
  }
}

extension UIApplication {
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
