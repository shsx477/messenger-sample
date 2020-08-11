import SwiftUI

struct EaTextEditView: View {
  @ObservedObject var vm: EaTextEditVM

  var body: some View {
    VStack {
      TopMenuView()
      Spacer()
      ContentView(text: $vm.text)
      Spacer()
    }
    .background(Color.blue)
    .environmentObject(self.vm)
  }
}

private struct TopMenuView: View {
  @EnvironmentObject var vm: EaTextEditVM
  
  var body: some View {
    HStack {
      EaCancelButton() {
        self.vm.close()
      }
      
      Spacer()
      
      Text("이름")
        .font(.system(size: 20))
        .foregroundColor(Color.white)
      
      Spacer()
      
      EaOkButton() {
        
      }
    }
    .paddingTopMenuForSheet()
  }
}

private struct ContentView: View {
  @Binding var text: String
  @State private var numberOfText: Int = 0
  
  init(text: Binding<String>) {
    self._text = text
    self.numberOfText = self.text.count
  }
  
  var body: some View {
    VStack {
      HStack {
        TextField("", text: $text)
          .multilineTextAlignment(.center)
          .foregroundColor(.white)
          .font(.system(size: 25))
        
        ZStack {
          Circle()
            .frame(width: 17, height: 17)
            .foregroundColor(Color.white)
          
          Image(systemName: "xmark.circle.fill")
          .foregroundColor(Color.gray)
        }
      }

      Divider()
        .background(Color.white)
      
      Text("\(numberOfText) / 20")
        .font(.system(size: 15))
        .foregroundColor(Color.white)
    }
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
  }
}

struct EaTextEditView_Previews: PreviewProvider {
  static var previews: some View {
    EaTextEditView(vm: EaTextEditVM(text: "test") {
      print("close")
    })
  }
}
