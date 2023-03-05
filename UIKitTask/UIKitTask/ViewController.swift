//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMyButton()
        
    }

//MARK: - Methods
    private func createMyButton() {
        myButton = UIButton(type: .roundedRect)
        
    }
    
}

