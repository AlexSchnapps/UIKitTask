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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(performAdd(param:)))
        
        let items = ["Up", "Down"]
        let segmentController = UISegmentedControl(items: items)
        segmentController.isMomentary = true
        segmentController.addTarget(self, action: #selector(segmentControllerTapped(param:)), for: .valueChanged)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: segmentController)
        
    }
    
    //MARK: - Methods
    fileprivate func createImageTitleView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "Ornament")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    @objc func performAdd(param: UIBarButtonItem) {
        print("Add click")
    }
    
    @objc func segmentControllerTapped(param: UISegmentedControl) {
        switch param.selectedSegmentIndex {
        case 0:
            print("Up")
        case 1:
            print("Down")
        default:
            break
        }
    }
    
}

