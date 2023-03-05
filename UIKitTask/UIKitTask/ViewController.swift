//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView.layer.borderWidth = 2
        myImageView.layer.borderColor = UIColor.lightGray.cgColor
        myImageView.layer.cornerRadius = 50
        myImageView.clipsToBounds = true
        
        
    }
}

