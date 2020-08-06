import SwiftUI

struct EaProfileImage: View {
  var imageData: Data?
  var size: CGFloat
  
  var body: some View {
    ZStack {
      UIImage(data: Util.tempProfileImageData).map {
        Image(uiImage: $0)
          .resizable()
      }
      
      imageData.map { UIImage(data: $0).map {
        Image(uiImage: $0)
          .resizable()
        }
      }
    }
    .frame(width: size, height: size)
    .aspectRatio(contentMode: .fit)
    .clipShape(Clipper())
  }
  
  
  init(imageData: Data?, size: CGFloat = 40) {
    self.imageData = imageData
    self.size = size
  }
}

private struct Clipper: Shape {
  private let offsetSeed: CGFloat = 8.0
  
  func path(in rect: CGRect) -> Path {
    let offset = rect.width / offsetSeed
    let tempPath = self.createPath(rect: rect, offset: offset)
    return Path(tempPath)
  }
  
  private func createPath(rect: CGRect, offset: CGFloat) -> CGPath {
    let path = UIBezierPath()
    
    let startPt = CGPoint(x: rect.width / 2, y: 0)
    path.move(to: startPt)
    
    self.drawRightTop(path: path, rect: rect, offset: offset)
    self.drawRightBottom(path: path, rect: rect, offset: offset)
    self.drawLeftBottom(path: path, rect: rect, offset: offset)
    self.drawLeftTop(path: path, rect: rect, offset: offset)
    
    return path.cgPath
  }
  
  private func drawRightTop(path: UIBezierPath, rect: CGRect, offset: CGFloat) {
    let toRightPt = CGPoint(x: rect.width, y: rect.height / 2)
    let controlPt1 = CGPoint(x: rect.width - offset, y: 0)
    let controlPt2 = CGPoint(x: rect.width, y: offset)
    path.addCurve(to: toRightPt, controlPoint1: controlPt1, controlPoint2: controlPt2)
  }
  
  private func drawRightBottom(path: UIBezierPath, rect: CGRect, offset: CGFloat) {
    let toBottomPt = CGPoint(x: rect.width / 2, y: rect.height)
    let controlPt1 = CGPoint(x: rect.width, y: rect.height - offset)
    let controlPt2 = CGPoint(x: rect.width - offset, y: rect.height)
    path.addCurve(to: toBottomPt, controlPoint1: controlPt1, controlPoint2: controlPt2)
  }
  
  private func drawLeftBottom(path: UIBezierPath, rect: CGRect, offset: CGFloat) {
    let toLeftPt = CGPoint(x: 0, y: rect.height / 2)
    let controlPt1 = CGPoint(x: offset, y: rect.height)
    let controlPt2 = CGPoint(x: 0, y: rect.height - offset)
    path.addCurve(to: toLeftPt, controlPoint1: controlPt1, controlPoint2: controlPt2)
  }
  
  private func drawLeftTop(path: UIBezierPath, rect: CGRect, offset: CGFloat) {
    let toTopPt = CGPoint(x: rect.width / 2, y: 0)
    let controlPt1 = CGPoint(x: 0, y: offset)
    let controlPt2 = CGPoint(x: offset, y: 0)
    path.addCurve(to: toTopPt, controlPoint1: controlPt1, controlPoint2: controlPt2)
  }
}

struct EaProfileImage_Previews: PreviewProvider {
  static var previews: some View {
    EaProfileImage(imageData: UIImage(named: "user-default")!.pngData()!)
  }
}
