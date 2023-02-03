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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAddButton()

    }
    
    private func createAddButton() {
        addButton.setTitle("Добавить", for: .normal)
        addButton.titleLabel?.textColor = .systemBlue
        addButton.titleLabel?.font = .systemFont(ofSize: 14)
        addButton.titleLabel?.textAlignment = .center
        addButton.frame = CGRect(x: 40, y: 100, width: 100, height: 31)
        view.addSubview(addButton)
    }
    
}

