//
//  ViewController.swift
//  MikeKondo-Kadai5
//
//  Created by 近藤米功 on 2022/04/14.
//

import UIKit

class CalculateViewController: UIViewController {
    private enum AlertMessageType: String {
        case number1IsNil = "割られる数を入力してください"
        case number2IsNil = "割る数を入力してください"
        case number2IsZero = "割る数には0以外の数を入力してください"
    }

    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var calculatedNumberLabel: UILabel!
    private var calculatedNumber: Float = 0

    @IBAction private func tappedCalculateButton(_ sender: Any) {
        guard let number1: Float = Float(number1TextField.text ?? "") else {
            alert(alertMessage: AlertMessageType.number1IsNil.rawValue)
            return
        }
        guard let number2: Float = Float(number2TextField.text ?? "") else {
            alert(alertMessage: AlertMessageType.number2IsNil.rawValue)
            return
        }
        if number2 == 0 {
            alert(alertMessage: AlertMessageType.number2IsZero.rawValue)
            return
        }
        calculatedNumber = Float(number1 / number2)
        calculatedNumberLabel.text = String(calculatedNumber)
    }

    private func alert(alertMessage: String) {
        let title = "課題5"
        let message = alertMessage
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
