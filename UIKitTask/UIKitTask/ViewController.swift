//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var myTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextView()
        
    }
    
//MARK: - Methods
    func createTextView() {
        myTextView = UITextView(frame: CGRect(x: 20, y: 100, width: self.view.bounds.width - 40, height: view.bounds.height / 2))
        myTextView.text = "Some text"
        // Расположение контента в TextView
        myTextView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        myTextView.font = .systemFont(ofSize: 17)
        myTextView.backgroundColor = .lightGray
        self.view.addSubview(myTextView)
    }
    // Убираем клавиатуру касанием за пределами TextViw
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.myTextView.resignFirstResponder()
        self.myTextView.backgroundColor = .white
    }
    
    func updateTextView(param: Notification) {
        let userInfo = param.userInfo
        
        let getKeyboardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardFrame = self.view.convert(getKeyboardRect, to: view.window)
    }
    
}

