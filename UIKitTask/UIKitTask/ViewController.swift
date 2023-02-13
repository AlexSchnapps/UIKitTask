//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var displaySecondButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FirstVC"
    
        self.displaySecondButton = UIButton(type: .system)
        self.displaySecondButton.setTitle("SecondVC", for: .normal)
        self.displaySecondButton.sizeToFit()
        self.displaySecondButton.center = self.view.center
        self.displaySecondButton.addTarget(self, action: #selector(performDisplaySecondVC), for: .touchUpInside)
        self.view.addSubview(self.displaySecondButton)
    }

    @objc func performDisplaySecondVC(parametrSender: Any) {
        let secondVC = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }

}

