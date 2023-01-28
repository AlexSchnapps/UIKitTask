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
    let entryButton = UIButton()
    let faceIDSwitch = UISwitch()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTopLabel()
        createSignInLabel()
        createEmailLabel()
        createLoginTextfield()
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
        loginTextfield.frame = CGRect(x: 45, y: 270, width: 200, height: 50)
        loginTextfield.addLine(position: .bottom, color: .lightGray, width: 1.0)
        view.addSubview(loginTextfield)
    }
    
}




