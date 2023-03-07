//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var myScrollView = UIScrollView()
    var myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createScrollView()
        
    }
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let p = "Начинается прокрутка"
        print(p)
        print(scrollView.contentOffset.x)
        print(scrollView.contentOffset.y)
        self.myScrollView.alpha = 0.50
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let p = "После прокрутки"
        print(p)
        self.myScrollView.alpha = 1.0
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let p = "Конец перетаскивания"
        print(p)
        self.myScrollView.alpha = 1.0
    }
    
    
    //MARK: - Methods
    func createScrollView() {
        let imageToLoad = UIImage(named: "Ghor")
        myScrollView.indicatorStyle = .black
        myImageView = UIImageView(image: imageToLoad)
        myScrollView = UIScrollView(frame: self.view.bounds)
        myScrollView.addSubview(myImageView)
        myScrollView.contentSize = self.myImageView.bounds.size
        myScrollView.delegate = self
        self.view.addSubview(myScrollView)
    }
    
}

