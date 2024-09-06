//
//  UploadViewController.swift
//  FinalProject_2311248
//
//  Created by english on 2024-04-10.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class UploadViewController: UIViewController {
    
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var descriptionText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func uploadButtonPressed(_ sender: UIButton) {
        
        let firestoreDatabase = Firestore.firestore()
        var firestoreReference: DocumentReference? = nil
        
        if titleText.text != "" && descriptionText.text != ""
        {
            let todo = [
                "title": titleText.text!,
                "desc": descriptionText.text!,
                "date": FieldValue.serverTimestamp()
            ] as [String: Any]
            firestoreReference = firestoreDatabase.collection("todos").addDocument(data: todo, completion: {
                                            (error) in
                                            print("Firestore Reference! ")
                                            if error != nil {
                                                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Unable to upload Todo")
                                            }else{
                                                
                                                self.titleText.text = ""
                                                self.descriptionText.text = ""
                                                print("Post Uploaded Successfully!")
                                                self.tabBarController?.selectedIndex = 0
                                            }
                                        })
            
        }else
        {
            makeAlert(title: "Missing", message: "Title/Description is missing" );
        }
    }
    
    func makeAlert(title: String, message: String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        // The present(_:animated:completion:) method is used to display the alert modally.
        self.present( alert, animated: true, completion: nil)
    }
}
