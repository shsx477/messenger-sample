import Foundation
import SwiftUI

struct EaUserModel: Decodable {
  var name: String
  var message: String
  var profileImage: Data?
  var backgroundImage: Data?
  
  
  static func createTestData() -> EaUserModel {
    let tempImage = UIImage(named: "userImage")!.pngData()!
    let tempBg = UIImage(named: "userBg")!.pngData()!
    
    return EaUserModel(name: "사용자",
                       message: "상태 메시지",
                       profileImage: tempImage,
                       backgroundImage: tempBg)
  }
}
