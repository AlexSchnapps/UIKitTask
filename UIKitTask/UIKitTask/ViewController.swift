//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControl = UISegmentedControl()
    var menuArray = ["One", "Two", "Three"]
    let imageArray = [
        UIImage(named: "Anubys.jpg"),
        UIImage(named: "Bhastet.jpg"),
        UIImage(named: "Ghor.jpg")
    ]
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        // MARK: - Create segmentControl
        segmentControl = UISegmentedControl(items: self.menuArray)
        segmentControl.frame = CGRect(x: 60, y: 500, width: 250, height: 100)
        segmentControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        segmentControl.backgroundColor = .lightGray
        self.view.addSubview(segmentControl)
        
        //MARK: - Image
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        imageView.image = imageArray[0]
        self.view.addSubview(imageView)
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == segmentControl {
            let segmentIndex = target.selectedSegmentIndex
            self.imageView.image = self.imageArray[segmentIndex]
        }
    }
    
}

