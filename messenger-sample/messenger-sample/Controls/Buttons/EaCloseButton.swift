import SwiftUI

struct EaCloseButton: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    Image(systemName: "xmark")
      .foregroundColor(.white)
      .onTapGesture {
        self.presentationMode.wrappedValue.dismiss()
    }
  }
}

struct EaCloseButton_Previews: PreviewProvider {
  static var previews: some View {
    EaCloseButton()
  }
}
