//
//  CalculatorError.swift
//  BMICalculator
//
//  Created by 쩡화니 on 1/4/24.
//

import Foundation

enum CalculatorError: Error {
  case outOfRange // 범위가 벗어났거나
  case invalidValue // 기대값(정수)이 아니거나
  case inSufficientTextField // 텍스트필드가 불충분하거나
  case soManyHighBMI // 매우 높은 BMI
}

extension CalculatorError: LocalizedError {
  public var errorDescription: String? {
    switch self {
    case .inSufficientTextField:
      return "텍스트에 모든 정보를 기입해주세요"
    case .invalidValue:
      return "정수값을 입력해주세요"
    case .outOfRange:
      return "정상수치를 벗어났어요 - 무게(40~200) , 키(120~220)"
    case .soManyHighBMI:
      return "BMI 수치가 매우 높아서 계산할 수 없어요!"
    }
  }
}
