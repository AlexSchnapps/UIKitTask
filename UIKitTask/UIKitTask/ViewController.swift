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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Create segmentControl
        segmentControl = UISegmentedControl(items: self.menuArray)
        segmentControl.frame = CGRect(x: 0, y: 0, width: 250, height: 100)
        segmentControl.center = self.view.center
        view.addSubview(segmentControl)
    }


}

