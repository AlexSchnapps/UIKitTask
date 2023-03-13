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
    
    var squareViews = [UIDynamicItem]()
    var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //MARK: - create View
        let numberOfView = 2
        squareViews.reserveCapacity(numberOfView)
        var colors = [UIColor.red, UIColor.green]
        var currentCenterPoint: CGPoint = view.center
        let eachViewSize = CGSize(width: 50, height: 50)
        
        for counter in 0..<numberOfView {
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
            newView.backgroundColor = colors[counter]
            newView.center = currentCenterPoint
            currentCenterPoint.y += eachViewSize.height + 10
            view.addSubview(newView)
            squareViews.append(newView)
        }
        
        animator = UIDynamicAnimator(referenceView: view)
        
        //MARK: - create gravity
        let gravity = UIGravityBehavior(items: squareViews)
        animator.addBehavior(gravity)
        
        //MARK: - Create collision
        let collision = UICollisionBehavior(items: squareViews)
        // метод останавливает объекты на нижней границе
        collision.translatesReferenceBoundsIntoBoundary = true
        
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, from: CGPoint(x: 0, y: view.bounds.size.height - 100),to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height - 100))
        
        collision.collisionDelegate = self
        animator.addBehavior(collision)
    
    }
    
    
    
}

extension ViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let identifier = identifier as? String
        let newBottomBoundary = "bottomBoundary"
        if identifier == newBottomBoundary {
            UIView.animate(withDuration: 1.0, animations: {
                let view = item as? UIView
                view?.backgroundColor = .red
                view?.alpha = 0.0
                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }, completion: {(finished) in
                let view = item as? UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
            })
        }
    }
}

