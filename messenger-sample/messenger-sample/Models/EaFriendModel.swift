import Foundation
import SwiftUI

struct EaFriendModel: Decodable, Identifiable {
  var id = UUID()
  var name: String
  var message: String
  var profileImage: Data?
  var backgroundImage: Data?
  
  
  static func createTestDatas() -> [EaFriendModel] {
    return [EaFriendModel(name: "친구1",
                          message: "상태 메시지",
                          profileImage: EaConstant.tempProfileImageData,
                          backgroundImage: nil),
            EaFriendModel(name: "친구2",
                          message: "상태 메시지",
                          profileImage: EaConstant.tempProfileImageData,
                          backgroundImage: nil),
            EaFriendModel(name: "친구3",
                          message: "상태 메시지",
                          profileImage: EaConstant.tempProfileImageData,
                          backgroundImage: nil),
            EaFriendModel(name: "친구4",
                          message: "상태 메시지",
                          profileImage: EaConstant.tempProfileImageData,
                          backgroundImage: nil),
    ]
  }
}
