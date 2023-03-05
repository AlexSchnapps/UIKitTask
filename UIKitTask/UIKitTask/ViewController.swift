//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var myImageView = UIImageView()
    let anubisImage = UIImage(named: "Anubys")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImageView = UIImageView(frame: self.view.bounds)
        myImageView.image = anubisImage
        myImageView.contentMode = .scaleAspectFit
        myImageView.center = view.center
        view.addSubview(myImageView)
        
    }


}

