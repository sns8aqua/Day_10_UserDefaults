//
//  ViewController.swift
//  UserDefaults
//
//  Created by Santhosh on 22/01/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        UserDefaults.standard.setValue(true, forKey: "UserLoggedIn")
//        let userLoggedIn = UserDefaults.standard.value(forKey: "UserLoggedIn")
//        UserDefaults.standard.removeObject(forKey: "UserLoggedIn")
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
                /// UserDefaults.standard.removeObject(forKey: "UserName")
        if let userNameText = UserDefaults.standard.value(forKey: "UserName") as? String, let passcodeText = UserDefaults.standard.value(forKey: "Passcode") as? String {
            print(userNameText)
            print(passcodeText)
            if userName.text != userNameText {
                self.showAlert(message: "Please enter correct username to continue.")
            } else if password.text != passcodeText {
                self.showAlert(message: "Please enter correct passcode to continue.")
            } else {
                print("Login Success")
            }
        } else {
            if (userName.text?.isEmpty ?? false) {
                self.showAlert(message: "Please enter username to continue.")
            } else if (password.text?.isEmpty ?? false) {
                self.showAlert(message: "Please enter passcode to continue.")
            } else {
                if let userNameData = userName.text, let passcodeData = password.text {
                    UserDefaults.standard.setValue(userNameData, forKey: "UserName")
                    UserDefaults.standard.setValue(passcodeData, forKey: "Passcode")
                }
            }
        }
    }
    
    
    func showAlert(title: String = "Alert", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            print("Ok Clicked")
        })
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    

    


}

