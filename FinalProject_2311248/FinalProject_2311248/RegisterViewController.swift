//
//  RegisterViewController.swift
//  FinalProject_2311248
//
//  Created by english on 2024-04-10.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerButtonPressed(_ sender: UIButton) {
       
        
        if emailTextField.text != "" && passwordTextField.text != "" {
                    Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text! ){
                        ( authData, error) in
                        if error != nil {
                            self.makeAlert(title: "Firebase Error", message: error?.localizedDescription ?? "Something went wrong!")
                        }else {
                            self.tabBarController?.selectedIndex = 0
                        }
                    }
                }else{
                    makeAlert(title: "Error", message: "Email/Password is missing!") //  custom Alert Function.
                }
                 tabBarController?.selectedIndex = 0
               // performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    func makeAlert(title: String, message: String  ){
        let alert = UIAlertController( title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present( alert, animated: true, completion: nil)
    }


}
