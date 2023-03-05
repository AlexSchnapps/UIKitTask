//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var myButton = UIButton()
    let normalImage = UIImage(named: "Ornament")
    let highlightedImage = UIImage(named: "vintag left arrow")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMyButton()
        
    }

//MARK: - Methods
    private func createMyButton() {
        myButton = UIButton(type: .roundedRect)
        myButton.setTitle("Ornament", for: .normal)
        myButton.setTitle("vintag left arrow", for: .highlighted)
        
        myButton.setBackgroundImage(normalImage, for: .normal)
        myButton.setBackgroundImage(highlightedImage, for: .highlighted)
        
        myButton.addTarget(self, action: #selector(buttonIsPressed(sender:)), for: .touchDown)
        myButton.addTarget(self, action: #selector(buttonIsTapped(sender:)), for: .touchUpInside)
        
        myButton.frame = CGRect(x: 110, y: 200, width: 100, height: 100)
        view.addSubview(myButton)
    }
    
    @objc func buttonIsPressed(sender: UIButton) {
        print("Button is pressed")
    }
    
    @objc func buttonIsTapped(sender: UIButton) {
        print("Button is tapped")
    }
    
}

