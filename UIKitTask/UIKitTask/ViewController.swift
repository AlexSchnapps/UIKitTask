//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in myButtons {
            button.setTitleColor(.green, for: .normal)
        }
        
    }


    @IBAction func buttonAction(_ sender: UIButton) {
        let button = sender
        if button.titleLabel?.text == "Button1" {
            print("Это первая кнопка")
        } else if button.tag == 3 {
            print("Кнопка 3")
        }
    }
}

