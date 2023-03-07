//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var myScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ghorImage = UIImage(named: "Ghor")
        let bhastetImage = UIImage(named: "Bhastet")
        let anubysImage = UIImage(named: "Anubys")
        
        let scrollViewRect = self.view.bounds
        
        //CreateScrollView
        myScrollView = UIScrollView(frame: scrollViewRect)
        
        // фиксация на изоброжении при перелистывании
        myScrollView.isPagingEnabled = true
        
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 3, height: scrollViewRect.size.height)
        self.view.addSubview(myScrollView)
        
        // Create image Ghor
        var imageViewRect = self.view.bounds
        let ghorImageView = self.newImageViewWithImage(paramImage: ghorImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(ghorImageView)
        
        // next page
        imageViewRect.origin.x += imageViewRect.size.width
        let bhastetImageView = self.newImageViewWithImage(paramImage: bhastetImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(bhastetImageView)
        
        // next page
        imageViewRect.origin.x += imageViewRect.size.width
        let anubysImageView = self.newImageViewWithImage(paramImage: anubysImage!, paramFrame: imageViewRect)
        myScrollView.addSubview(anubysImageView)
        
    }
    //MARK: - UIScrollViewDelegate
    
    //MARK: - Methods
    func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }
}

