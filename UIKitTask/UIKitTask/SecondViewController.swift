//
//  SecondViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 13.02.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "SecondVC"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    
    @objc func goBack() {
        //self.navigationController?.popViewController(animated: true)
        // Получаем текущий массив контроллеров
        
        var currentControllersArray = navigationController?.viewControllers
        
        // Удаляем контроллер
        currentControllersArray?.removeLast()
        
        // Присвоим
        if let newController = currentControllersArray {
            navigationController?.viewControllers = newController
        }
    }
    
}
