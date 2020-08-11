import Foundation
import SwiftUI

struct EaCustomTextField: UIViewRepresentable {
  @Binding var text: String
  @Binding var maxLength: Int
  var isFirstResponder: Bool = false
  
  func makeUIView(context: UIViewRepresentableContext<EaCustomTextField>) -> UITextField {
    let textField = UITextField(frame: .zero)
    textField.textAlignment = .center
    textField.keyboardType = .default
    textField.autocorrectionType = .no
    textField.delegate = context.coordinator
    return textField
  }
  
  func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<EaCustomTextField>) {
    uiView.text = text
    if isFirstResponder {
      uiView.becomeFirstResponder()
    }
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(text: $text, maxLength: $maxLength)
  }
  
  
  class Coordinator: NSObject, UITextFieldDelegate {
    @Binding var text: String
    @Binding var maxLength: Int


    init(text: Binding<String>, maxLength: Binding<Int>) {
      _text = text
      _maxLength = maxLength
    }

    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
      
      guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else { return false }
      
      let subStringToReplace = textFieldText[rangeOfTextToReplace]
      let count = textFieldText.count - subStringToReplace.count + string.count
      
      if self.maxLength > 0 {
        if count > self.maxLength {
          return false
        }
        
        let newString = textFieldText.replacingCharacters(in: rangeOfTextToReplace, with: string)
        self.text = newString
      }
      
      return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return false
    }
  }
}
