//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let myProgressView = UIProgressView()
    let myButton = UIButton()
    var myTimer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createProgressView(myProgressView)
        createButton(myButton)
        createTimer()
    }

    //MARK: - Timer
    func createTimer() {
        myTimer = Timer(timeInterval: 1,
                        target: self,
                        selector: #selector(updateProgressView),
                        userInfo: nil,
                        repeats: true)
    }
    
    //MARK: - selektor
    @objc func updateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.1 / 1.0
        }else if myProgressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7, animations:{ self.myButton.alpha = 1
                self.myButton.setTitle("Старт", for: .normal)
                self.myTimer.invalidate()
            })
        }
    }
    
    
    //MARK: - UI methods
    func createProgressView(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x, y: view.center.y, width: 150, height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.tintColor = .red
        progressView.trackTintColor = .black
        progressView.center = view.center
        view.addSubview(progressView)
    }
    
    func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.bounds.size.width / 4, y: view.center.y + 100, width: 150, height: 50)
        button.setTitle("Загрузка ...", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.alpha = 0.2
        button.layer.cornerRadius = 10
        view.addSubview(button)
    }

}

