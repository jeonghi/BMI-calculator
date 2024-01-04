//
//  BMI.swift
//  BMICalculator
//
//  Created by 쩡화니 on 1/4/24.
//

import Foundation

enum BMI: String {
  case 저체중
  case 정상
  case 과체중
  case 비만
  case 고도비만
  
  init(_ bmi: Float){
    switch bmi {
    case ...18.5:
      self = .저체중
    case 18.5...23.0:
      self = .정상
    case 23.0..<25.0:
      self = .과체중
    case 25.0..<30.0:
      self = .비만
    default:
      self = .고도비만
    }
  }
}
