
//
//  Created by Aleksandr Luchinin on 14.10.2022.
///

import UIKit

final class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let fromLoginToTabBarSegue = "fromLoginToTabBar"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(recognizer)
    }
    
    
    @objc func keyboardDidShow(_ notification: Notification) {
        guard let keyboardHeight = ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue)?.height else {return}
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }
    
    
    @objc func onTap() {
        self.view.endEditing(true)
    }
    
    @objc func keyboardDidHide() {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else {return}
        
        
        override func shouldPerformSegue(withIdentifier identifier: String, sender:
                                            Any?) -> Bool {
            
            let login = loginInput.text!
            let password = passwordInput.text!
            
            if login == "admin" && password == "1234" {
                performSegue(withIdentifier: fromLoginToTabBarSegue, sender: nil)
                return true
            } else {
                // Создаю Алерт контроллер
                let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
                // Создаю кнопку для Алерконтролера
                let action = UIAlertAction(title: "OK", style: .cancel, handler:
                                            nil)
                // Добавляем кнопку на UIAlertController
                alert.addAction(action)
                // Показ Алертконтролера
                present(alert, animated: true, completion: nil)
                return false        }
            
        }
        
    }
}
