//
//  BMICalculatable.swift
//  BMICalculator
//
//  Created by 쩡화니 on 1/4/24.
//

import Foundation

protocol BMICalculatable {
  func setRandomValues()
  func calculateBMI()
  func showSuccessResultAlert(_ result: BMI)
  func showErrorResultAlert(_ error: CalculatorError)
}
