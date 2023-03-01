//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let myLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelFrame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        myLabel.frame = labelFrame
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.text = "Exemple for Label in XCode"
        myLabel.textColor = .lightGray
        myLabel.shadowColor = .black
        myLabel.shadowOffset = CGSize(width: 2, height: 2)
        myLabel.font = UIFont.boldSystemFont(ofSize: 24)
        myLabel.center = self.view.center
        view.addSubview(myLabel)
        myLabel.sizeToFit()
        
    }


}

