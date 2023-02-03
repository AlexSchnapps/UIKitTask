//
//  VCTwo.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 29.01.2023.
//

import UIKit

class VCTwo: UIViewController {
    
    let topLabel = UILabel()
    let addUserButton = UIButton()
    let backButton  = UIButton()
    let userNameLabel = UILabel()
    var userAvatarImage = UIImage()
    let userBirthdayDateLabel = UILabel()
    let daysLeftLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        createTopLabel()
        createAddUserButton()
        createBackButton()
        createUserAvatarImage()
    }
    
    private func createAddUserButton() {
        addUserButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addUserButton.frame = CGRect(x: 310, y: 30, width: 50, height: 50)
        addUserButton.addTarget(self, action: #selector(goToVCThree(sender: )), for: .touchUpInside)
        view.addSubview(addUserButton)
    }
    
    private func createBackButton() {
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.frame = CGRect(x: 20, y: 30, width: 50, height: 50)
        backButton.addTarget(self, action: #selector(backToVCOne(sender: )), for: .touchUpInside)
        view.addSubview(backButton)
        
    }
    
    private func createTopLabel() {
        topLabel.text = "Birthday"
        topLabel.textAlignment = .center
        topLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        topLabel.frame = CGRect(x: 140, y: 35, width: 100, height: 30)
        view.addSubview(topLabel)
    }
    
    @objc func backToVCOne(sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let oldVC = storyBoard.instantiateViewController(identifier: "ViewController") as? ViewController {
            oldVC.modalPresentationStyle = .fullScreen
            show(oldVC, sender: nil)
        }
    }
    
    @objc func goToVCThree(sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let instantiVC = storyBoard.instantiateViewController(identifier: "VCThree") as? VCThree {
            instantiVC.modalPresentationStyle = .fullScreen
            show(instantiVC, sender: nil)
        }
    }
    
    private func createUserAvatarImage() {
        userAvatarImage = UIImage(named: "Avatar.jpg")!
       let userAvatarImageView = UIImageView(image: userAvatarImage)
        userAvatarImageView.frame = CGRect(x: 15, y: 100, width: 60, height: 60)
        view.addSubview(userAvatarImageView)
    }
    
}

