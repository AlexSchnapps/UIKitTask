//
//  VCThree.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 01.02.2023.
//

import UIKit

class VCThree: UIViewController {
    
    let addButton = UIButton()
    let cancellButton = UIButton()
    var avatarImage = UIImage()
    let anyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonCreate()
        cancellButtonCreate()
        avatarImageCreate()
    }
    
    private func addButtonCreate() {
        addButton.setTitle("Добавить", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        addButton.titleLabel?.textAlignment = .center
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.frame = CGRect(x: 280, y: 10, width: 80, height: 40)
        addButton.addTarget(self, action: #selector(addUser(sender:)), for: .touchUpInside)
        view.addSubview(addButton)
    }
    
    private func cancellButtonCreate() {
        cancellButton.setTitle("Отмена", for: .normal)
        cancellButton.setTitleColor(.systemBlue, for: .normal)
        cancellButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        cancellButton.titleLabel?.textAlignment = .center
        cancellButton.frame = CGRect(x: 10, y: 10, width: 80, height: 40)
        cancellButton.addTarget(self, action: #selector(backToVCTwo(sender:)), for: .touchUpInside)
        view.addSubview(cancellButton)
    }
    
    private func avatarImageCreate() {
        avatarImage = UIImage(named: "Avatar.jpg")!
      let avatarImageView = UIImageView(image: avatarImage)
        avatarImageView.frame = CGRect(x: 120, y: 80, width: 150, height: 150)
        view.addSubview(avatarImageView)
    }
    
    //MARK: - @ojc func
    
    @objc func backToVCTwo(sender: UIButton) {
        let storiboard = UIStoryboard(name: "Main", bundle: nil)
        if let instantiateVC = storiboard.instantiateViewController(withIdentifier: "VCTwo") as? VCTwo {
            instantiateVC.modalPresentationStyle = .fullScreen
            show(instantiateVC, sender: nil)
        }
    }
    
    @objc func addUser(sender: UIButton) {
        
    }
    
}


