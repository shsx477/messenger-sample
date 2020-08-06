import SwiftUI

extension Image {
  func setSize(size: CGFloat) -> some View {
    self.font(.system(size: size))
  }
}
