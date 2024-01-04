//
//  ViewController.swift
//  BMICalculator
//
//  Created by 쩡화니 on 1/4/24.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: IBOutlet
  @IBOutlet var heightTextField: UITextField!
  @IBOutlet var weightTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    configUI() // UI설정
  }
  
  // MARK: IBAction
  @IBAction func tappedCalculateRandomBMI(_ sender: UIButton){
    setRandomValues()
    calculateBMI()
  }
  
  @IBAction func textInputDone(_ sender: UITextField) {
    view.endEditing(true)
  }
  
  @IBAction func tappedAroundView(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
  }
  
  @IBAction func tappedShowResult(_ sender: UIButton){
    calculateBMI()
  }
  
  @IBAction func inputHeightText(_ sender: UITextField){
    
  }
  
  @IBAction func inputWeightText(_ sender: UITextField){
    
  }
  
  /// 랜덤으로 무게(40~150) , 키(120~220) 설정
  func setRandomValues() {
    let weight = Int.random(in: 40...200)
    let height = Int.random(in: 50...220)
    weightTextField.text = String(weight)
    heightTextField.text = String(height)
  }
}

// MARK: View init
extension ViewController {
  func configUI(){
    /// 전체 UI 설정
    [heightTextField, weightTextField].forEach {
      configTextFieldUI($0)
    }
  }
  
  /// 텍스트필드 UI 설정
  func configTextFieldUI(_ textField: UITextField){
    textField.layer.cornerRadius = 6
    textField.layer.borderColor = UIColor.systemGray5.cgColor
    textField.layer.borderWidth = 1
  }
}

// MARK: View Defined Action
extension ViewController {
  /// BMI 계산 = 체중 / (신장^2)
  func calculateBMI() {
    guard let height = heightTextField.text, let weight = weightTextField.text else {
      showErrorResultAlert(.inSufficientTextField)
      return
    }
    
    guard let height = Int(height), let weight = Int(weight) else {
      showErrorResultAlert(.invalidValue)
      return
    }
    
    guard 50 <= height, height <= 220, 40 <= weight, weight <= 200 else {
      showErrorResultAlert(.outOfRange)
      return
    }
    
    
    /// Zero Division 방지 ... try 문 사용하는게 나을지도.?
    
    let square_height = Float (height*height/10000)
    
    guard square_height > 0 else {
      showErrorResultAlert(.soManyHighBMI)
      return
    }
    
    let bmi = Float(weight)/square_height
    
    showSuccessResultAlert(String(format: "%.2f", bmi))
    
    return
  }
  
  /// 결과 창 표시
  func showSuccessResultAlert(_ result: String){
    
    let alertController = UIAlertController(title: "BMI 계산결과는요? 득근득근 💓", message: "\(result)", preferredStyle: .alert)
    
    let tappedConfirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
    
    alertController.addAction(tappedConfirmAction)
    present(alertController, animated: true)
  }
  
  /// 에러 창 표시
  func showErrorResultAlert(_ error: CalculatorError){
    let alertController = UIAlertController(title: "에러 발생!", message: "\(error.localizedDescription)", preferredStyle: .alert)
    
    let tappedCloseAction = UIAlertAction(title: "닫기", style: .default, handler: nil)
    
    alertController.addAction(tappedCloseAction)
    present(alertController, animated: true)
  }
}

// MARK: View Defined Error
extension ViewController {
  enum CalculatorError: Error {
    case outOfRange // 범위가 벗어났거나
    case invalidValue // 기대값(정수)이 아니거나
    case inSufficientTextField // 텍스트필드가 불충분하거나
    case soManyHighBMI // 매우 높은 BMI
  }
}

extension ViewController.CalculatorError: LocalizedError {
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
