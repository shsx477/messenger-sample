import SwiftUI

struct EaTextEditView: View {
  @ObservedObject var vm: EaTextEditVM
  
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color.black)
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        TopMenuView()
        Spacer()
        ContentView()
        Spacer()
      }
      .keyboardAwarePadding()
    }
    .environmentObject(self.vm)
  }
}

private struct TopMenuView: View {
  @EnvironmentObject var vm: EaTextEditVM
  
  var body: some View {
    HStack {
      EaCancelButton() {
        self.vm.close(isApply: false)
      }
      
      Spacer()
      
      Text("이름")
        .font(.system(size: 20))
        .foregroundColor(Color.white)
      
      Spacer()
      
      EaOkButton() {
        self.vm.close(isApply: true)
      }
    }
    .paddingTopMenuForSheet()
  }
}

private struct ContentView: View {
  @EnvironmentObject var vm: EaTextEditVM
  
  var body: some View {
    VStack {
      ZStack {
        EaCustomTextField(text: $vm.text, maxLength: $vm.maxLength, isFirstResponder: true)
          .foregroundColor(.white)
          .frame(height: 25)
        
        HStack {
          Spacer()
          ZStack {
            Circle()
              .frame(width: 17, height: 17)
              .foregroundColor(Color.white)
            
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(Color.gray)
              .onTapGesture {
                self.vm.clearText()
            }
          }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
      }
      
      Divider()
        .background(Color.white)
      
      Text("\(vm.textCount) / \(vm.maxLength)")
        .font(.system(size: 15))
        .foregroundColor(Color.white)
    }
    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
  }
}

struct EaTextEditView_Previews: PreviewProvider {
  private static let vm: EaTextEditVM = {
    let vm = EaTextEditVM { _, _ in
      print("")
    }
    vm.text = "test123123123"
    return vm
  }()
  
  static var previews: some View {
    EaTextEditView(vm: vm)
  }
}
