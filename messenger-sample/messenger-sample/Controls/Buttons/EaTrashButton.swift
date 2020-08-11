import SwiftUI

struct EaTrashButton: View {
  var action: () -> Void
  
  var body: some View {
    Image(systemName: "trash")
      .foregroundColor(Color.gray)
      .onTapGesture {
        self.action()
    }
  }
}

struct EaTrashButton_Previews: PreviewProvider {
  static var previews: some View {
    EaTrashButton() {
      print("trash")
    }
  }
}
