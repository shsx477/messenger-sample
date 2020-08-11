import SwiftUI

struct EaCancelButton: View {
  var title: String = "취소"
  var action: () -> Void
  
  var body: some View {
    Button(title, action: action)
      .foregroundColor(Color.white)
  }
}

struct EaCancelButton_Previews: PreviewProvider {
  static var previews: some View {
    EaCancelButton() {
      print("cancel")
    }
  }
}
