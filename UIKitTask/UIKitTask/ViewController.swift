//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createImageTitleView()
    }
    
    //MARK: - Methods
    fileprivate func createImageTitleView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "Ornament")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
}

