//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //UICollisionBehavior - поведение при столкновении
    //UIGravityBehavior - обеспечивает гравитацию
    //UIPushBehavior - реакции на толчки
    //UISnapBehavior - крепит view к определенной точке

    let squareView = UIView()
    var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //MARK: - create a square (квадрат)
        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squareView.backgroundColor = .green
        squareView.center = view.center
        view.addSubview(squareView)
        
        //MARK: - create animation and gravity
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [squareView])
        animator.addBehavior(gravity)
    }

    
    
}

