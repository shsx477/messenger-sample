import SwiftUI

struct test: View {
    var body: some View {
      VStack(alignment: .center, spacing: 0) {
        Rectangle().frame(height: 100).foregroundColor(Color.yellow)

        Rectangle()
          .frame(height: 10)
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
          .foregroundColor(Color.blue)

        Rectangle().frame(height: 100).foregroundColor(Color.red)
      }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
