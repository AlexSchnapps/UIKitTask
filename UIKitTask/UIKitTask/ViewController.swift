//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let myTextfield = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        
        //MARK: - Подписались на delegate
        myTextfield.delegate = self
        
        //MARK: - Подписались на NotificationCenter
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChange), name: UITextField.textDidChangeNotification, object: nil)
        
        //MARK: - Для смещения поля ввода вверх при появлении клавиатуры:
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -200
        }
        
        //MARK: - Возвращаем на исходную позицию после скрытия клавиатуры:
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
    
        //MARK: - клавиатура всплывает сразу
        self.myTextfield.becomeFirstResponder()
        
    }
    
    //MARK: - CreateTextField
    func createTextField() {
        
        let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        
        myTextfield.frame = textFieldFrame
        myTextfield.borderStyle = .roundedRect
        myTextfield.contentVerticalAlignment = .center
        myTextfield.textAlignment = .center
        myTextfield.placeholder = "Enter text"
        myTextfield.center = view.center
        view.addSubview(myTextfield)
    }
    
    //MARK: - Notification
    @objc func textFieldTextDidChange(ncParam: NSNotification) {
        print("textFieldTextDidChange \(ncParam)")
    }
    
    
    //MARK: - UITextfieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing разрешение на редактирование поля")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("реагирует на начало редактирования")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Редактирование окончено")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Редактирование окончено 2")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing")
    }
    //MARK: - можно использовать для валидации
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn Вы ввели букву \(string)")
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear Ты что - то очистил")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn хотите убрать клавиатуру?")
        if myTextfield == textField {
            self.myTextfield.resignFirstResponder()
        }
        return true
    }
    
    
    /*
     * @abstract Asks the delegate for the menu to be shown for the specified text range.
     *
     * @param textField                   The text field requesting the menu.
     * @param range                            The characters range for which the menu is presented for.
     * @param suggestedActions   The actions and commands that the system suggests.
     *
     * @return Return a UIMenu describing the desired menu hierarchy. Return @c nil to present the default system menu.
     
     @available(iOS 16.0, *)
     optional func textField(_ textField: UITextField, editMenuForCharactersIn range: NSRange, suggestedActions: [UIMenuElement]) -> UIMenu?
     
     
     /**
      * @abstract Called when the text field is about to present the edit menu.
      *
      * @param textField    The text field displaying the menu.
      * @param animator      Appearance animator. Add animations to this object to run them alongside the appearance transition.
      */
     @available(iOS 16.0, *)
     optional func textField(_ textField: UITextField, willPresentEditMenuWith animator: UIEditMenuInteractionAnimating)
     
     
     /**
      * @abstract Called when the text field is about to dismiss the edit menu.
      *
      * @param textField    The text field displaying the menu.
      * @param animator      Dismissal animator. Add animations to this object to run them alongside the dismissal transition.
      */
     @available(iOS 16.0, *)
     optional func textField(_ textField: UITextField, willDismissEditMenuWith animator: UIEditMenuInteractionAnimating)
     }
     extension UITextField {
     
     
     public class let textDidBeginEditingNotification: NSNotification.Name
     
     public class let textDidEndEditingNotification: NSNotification.Name
     
     public class let textDidChangeNotification: NSNotification.Name
     
     
     @available(iOS 10.0, *)
     public class let didEndEditingReasonUserInfoKey: String
     
     public enum BorderStyle : Int, @unchecked Sendable {
     
     case none = 0
     
     case line = 1
     
     case bezel = 2
     
     case roundedRect = 3
     }
     
     public enum ViewMode : Int, @unchecked Sendable {
     
     case never = 0
     
     case whileEditing = 1
     
     case unlessEditing = 2
     
     case always = 3
     }
     
     @available(iOS 10.0, *)
     public enum DidEndEditingReason : Int, @unchecked Sendable {
     
     case committed = 0
     }
     */
}

