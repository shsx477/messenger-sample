import Foundation
import SwiftUI

extension View {
  func paddingTopMenuForSheet() -> some View {
    let pad: CGFloat = 20
    return padding(EdgeInsets(top: pad, leading: pad, bottom: pad, trailing: pad))
  }
}
