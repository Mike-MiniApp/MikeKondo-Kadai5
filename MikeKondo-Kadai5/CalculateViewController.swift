//
//  ViewController.swift
//  MikeKondo-Kadai5
//
//  Created by 近藤米功 on 2022/04/14.
//

import UIKit

class CalculateViewController: UIViewController {
    private enum AlertMessage {
        static let number1IsNil = "割られる数を入力してください"
        static let number2IsNil = "割る数を入力してください"
        static let number2IsZero = "割る数には0以外の数を入力してください"
    }

    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var calculatedNumberLabel: UILabel!

    @IBAction private func tappedCalculateButton(_ sender: Any) {
        guard let number1: Float = Float(number1TextField.text ?? "") else {
            alert(message: AlertMessage.number1IsNil)
            return
        }
        guard let number2: Float = Float(number2TextField.text ?? "") else {
            alert(message: AlertMessage.number2IsNil)
            return
        }
        guard number2 != 0 else {
            alert(message: AlertMessage.number2IsZero)
            return
        }
        let calculatedNumber = Float(number1 / number2)
        calculatedNumberLabel.text = String(calculatedNumber)
    }

    private func alert(message: String) {
        let title = "課題5"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
