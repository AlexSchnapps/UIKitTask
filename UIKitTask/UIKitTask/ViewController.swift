//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    //UIAttachmentBehavior - привязка
    //UISnapBehavior - снимок
    
    var squareView = UIView()
    var squareViewAnchorView = UIView()
    var anchorView = UIView()
    var animator = UIDynamicAnimator()
    var attachmentBehavior: UIAttachmentBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSmallSquareView()
        createGastureRecognizer()
        createAnchorView()
        createAnimationAndBehaviors()
    }

//MARK: - create square
    func createSmallSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        squareViewAnchorView = UIView(frame: CGRect(x: 60, y: 0, width: 20, height: 20))
        squareViewAnchorView.backgroundColor = .brown
        squareView.addSubview(squareViewAnchorView)
        view.addSubview(squareView)
    }
    
    //MARK: - view с точкой привязки
    func createAnchorView() {
        anchorView = UIView(frame: CGRect(x: 120, y: 120, width: 20, height: 20))
        anchorView.backgroundColor = .red
        view.addSubview(anchorView)
    }
    
    //MARK: - create PanGestureRecognizer(Панорамный распознаватель жестов)
    func createGastureRecognizer() {
        let panGastureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handletPan(paramPan:)))
        panGastureRecognizer.state = .began
        view.addGestureRecognizer(panGastureRecognizer)
    }
    
    //MARK: - Столкновение и якорь
    func createAnimationAndBehaviors() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        attachmentBehavior = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(collision)
        animator.addBehavior(attachmentBehavior!)
    }
    
    // определяет где палец передает туда красный квадрат, а потом привязывает к большому квадрату
    @objc func handletPan(paramPan: UIPanGestureRecognizer) {
        let tapPoint = paramPan.location(in: view)
        print(tapPoint)
        attachmentBehavior?.anchorPoint = tapPoint
        anchorView.center = tapPoint
    }
    
}

