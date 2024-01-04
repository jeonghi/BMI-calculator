//
//  UserDefaultManager.swift
//  BMICalculator
//
//  Created by 쩡화니 on 1/4/24.
//

import Foundation

final class UserDefaultManager {
  
  private init() {}
  
  @UserDefaultWrapper(key: Key.USER.rawValue, defaultValue: nil)
  static var userInfo: UserInfo?
}

extension UserDefaultManager {
  /// 키 정의
  enum Key: String {
    case USER
  }
}
