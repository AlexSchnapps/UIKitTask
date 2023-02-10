//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var shareButton = UIButton()
    var mainTextField = UITextField()
    var activityVC: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createTextField()
        self.createButton()
        
    }

    //MARK: - Method
    
    func createTextField() {
        self.mainTextField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        mainTextField.center = view.center
        mainTextField.borderStyle =  UITextField.BorderStyle.roundedRect
        mainTextField.placeholder = "Enter text to share"
        mainTextField.delegate = self
        view.addSubview(mainTextField)
    }

    func createButton() {
        shareButton = UIButton(type: .roundedRect)
        shareButton.frame = CGRect(x: 50, y: 350, width: 280, height: 45)
        shareButton.setTitle("Расшарить", for: .normal)
        shareButton.addTarget(self, action: #selector(hendleShare), for: .touchUpInside)
        view.addSubview(shareButton)
    }
    
    @objc func hendleShare(paramSender: Any) {
        let text = mainTextField.text
        if text!.isEmpty {
            let message = "Введите текст"
            let allertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            allertController.addAction(action)
            present(allertController, animated: true)
        }
        self.activityVC = UIActivityViewController(activityItems: [self.mainTextField.text ?? "nil"], applicationActivities: nil)
        self.present(self.activityVC!, animated: true)
    }
    
//MARK: - TextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.mainTextField.resignFirstResponder()
        return true
    }
    
}

