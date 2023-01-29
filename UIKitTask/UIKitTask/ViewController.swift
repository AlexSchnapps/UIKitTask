//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

enum LinePosition {
    case top
    case bottom
}

extension UIView {
    func addLine(position: LinePosition, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .top:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .bottom:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}

class ViewController: UIViewController {
    
    let topLabel = UILabel()
    let signInLabel = UILabel()
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let faceIDLabel = UILabel()
    let loginTextfield = UITextField()
    let passwordTextfield = UITextField()
    var entryButton = UIButton()
    let faceIDSwitch = UISwitch()
    let togglePasswordVisibilityButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTopLabel()
        createSignInLabel()
        createEmailLabel()
        createLoginTextfield()
        createPasswordLabel()
        createPasswordTextfield()
        createFaceIDLabel()
        createFaceIDSwitch()
        createEntryButton()
        createTogglePasswordVisibilityButton()
    }
    //MARK: - Methods
    private func createTopLabel() {
        topLabel.text = "Birthday Remynder"
        topLabel.layer.borderColor = UIColor.black.cgColor
        topLabel.layer.borderWidth = 1.0
        topLabel.textColor = .systemBlue
        topLabel.alpha = 0.7
        topLabel.textAlignment = .center
        topLabel.frame = CGRect(x: 85, y: 60, width: 200, height: 70)
        view.addSubview(topLabel)
    }
    
    private func createSignInLabel() {
        signInLabel.text = "Sign In"
        signInLabel.font = .systemFont(ofSize: 27, weight: .semibold)
        signInLabel.textAlignment = .center
        signInLabel.frame = CGRect(x: 12, y: 200, width: 150, height: 30)
        view.addSubview(signInLabel)
    }
    
    private func createEmailLabel() {
        emailLabel.text = "Email"
        emailLabel.textColor = .systemBlue
        emailLabel.font = .systemFont(ofSize: 14)
        emailLabel.alpha = 0.7
        emailLabel.textAlignment = .left
        emailLabel.frame = CGRect(x: 45, y: 240, width: 150, height: 30)
        view.addSubview(emailLabel)
    }
    
    private func createLoginTextfield() {
        loginTextfield.keyboardType = .emailAddress
        loginTextfield.font = .systemFont(ofSize: 16)
        loginTextfield.frame = CGRect(x: 45, y: 260, width: 270, height: 45)
        loginTextfield.addLine(position: .bottom, color: .lightGray, width: 1.5)
        view.addSubview(loginTextfield)
    }
    
    private func createPasswordLabel() {
        passwordLabel.text = "Password"
        passwordLabel.textColor = .systemBlue
        passwordLabel.font = .systemFont(ofSize: 14)
        passwordLabel.alpha = 0.7
        passwordLabel.textAlignment = .left
        passwordLabel.frame = CGRect(x: 45, y: 330, width: 150, height: 30)
        view.addSubview(passwordLabel)
    }
    
    private func createPasswordTextfield() {
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.font = .systemFont(ofSize: 16)
        passwordTextfield.frame = CGRect(x: 45, y: 350, width: 270, height: 45)
        passwordTextfield.addLine(position: .bottom, color: .lightGray, width: 1.5)
        view.addSubview(passwordTextfield)
    }
    
    private func createFaceIDLabel() {
        faceIDLabel.text = "Вход по Face ID"
        faceIDLabel.frame = CGRect(x: 130, y: 430, width: 150, height: 30)
        faceIDLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        view.addSubview(faceIDLabel)
    }
    
    private func createFaceIDSwitch() {
        faceIDSwitch.frame = CGRect(x: 260, y: 430, width: 0, height: 0)
        faceIDSwitch.isOn = true
        view.addSubview(faceIDSwitch)
    }
    
    private func createEntryButton() {
        entryButton.setTitle("Войти", for: .normal)
        entryButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        entryButton.titleLabel?.textAlignment = .center
        entryButton.alpha = 0.5
        entryButton.layer.cornerRadius = 5
        entryButton.backgroundColor = .systemBlue
        entryButton.frame = CGRect(x: 50, y: 500, width: 280, height: 45)
        view.addSubview(entryButton)
    }
    
    private func createTogglePasswordVisibilityButton() {
        togglePasswordVisibilityButton.setImage(UIImage(named: "closedEye.png"), for: .normal)
        togglePasswordVisibilityButton.setImage((UIImage(named: "openEye.png")), for: .highlighted)
        togglePasswordVisibilityButton.frame = CGRect(x: 280, y: 365, width: 20, height: 20)
        view.addSubview(togglePasswordVisibilityButton)
        
    }
    
}




