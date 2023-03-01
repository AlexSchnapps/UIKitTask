//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let myTextfield = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        myTextfield.frame = textFieldFrame
        
        myTextfield.center = view.center
        view.addSubview(myTextfield)
        
    }


}

