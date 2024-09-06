//
//  SettingsViewController.swift
//  FinalProject_2311248
//
//  Created by english on 2024-04-10.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
        }catch {
            print("error")
            self.performSegue(withIdentifier: "toLoginVC", sender: nil)
        }
        performSegue(withIdentifier: "toLoginVC", sender: nil)
        //performSegue(withIdentifier: "toLoginVC", sender: nil)
    }
    
}
