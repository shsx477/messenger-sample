import SwiftUI

struct EaOkButton: View {
  var title: String = "확인"
  var action: () -> Void
  
  var body: some View {
    Button(title, action: action)
      .foregroundColor(Color.white)
  }
}

struct EaOkButton_Previews: PreviewProvider {
  static var previews: some View {
    EaOkButton() {
      print("ok")
    }
  }
}
