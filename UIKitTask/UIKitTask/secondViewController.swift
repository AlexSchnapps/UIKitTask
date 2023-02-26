//
//  secondViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 26.02.2023.
//

import UIKit

class secondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "SecondVC"
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        self.tabBarItem = tabBarItem
        
        view.backgroundColor = .blue
    }
}
