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
    
    return EaUserModel(name: "한선수",
                       message: "not bad",
                       profileImage: tempImage,
                       backgroundImage: tempBg)
  }
}
