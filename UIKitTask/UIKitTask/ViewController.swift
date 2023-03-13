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
    
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var pushBehavior = UIPushBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createGestureRecognazer()
        createSmallSquerView()
        createAnimationAndBehaviors()
    }
    //MARK: - Create square
    func createSmallSquerView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    //MARK: - create gesture (жест)
    func createGestureRecognazer() {
        let tapGestureRecognazer = UITapGestureRecognizer(target: self, action: #selector(hendleTap(paramTap:)))
        view.addGestureRecognizer(tapGestureRecognazer)
    }
    
    //MARK: - create collision(столкновение)
    
    func createAnimationAndBehaviors() {
        animator = UIDynamicAnimator(referenceView: view)
        //столкновение
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        pushBehavior = UIPushBehavior(items: [squareView], mode: .continuous)
        animator.addBehavior(collision)
        animator.addBehavior(pushBehavior)
    }
    
    @objc func hendleTap(paramTap: UITapGestureRecognizer) {
        // угол View
        let tapPoint: CGPoint = paramTap.location(in: view)
        let squareViewCenterPoint: CGPoint = squareView.center
        
        //arc tangent 2((p1.x - p2.x), (p1.y - p2.y))
        let deltaX: CGFloat = tapPoint.x - squareViewCenterPoint.x
        let deltaY: CGFloat = tapPoint.y - squareViewCenterPoint.y
        let angle: CGFloat = atan2(deltaY, deltaX)
        pushBehavior.angle = angle
        
        let distanceBetweenPints: CGFloat = sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0) + pow(tapPoint.y - squareViewCenterPoint.y, 2.0))
        pushBehavior.magnitude = distanceBetweenPints / 200
    }
    
}

