//
//  ViewController.swift
//  Task1405
//
//  Created by Balaji U on 14/05/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var userLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.errorLabel.isHidden = true
    }

    
    @IBAction func logInButtonTapped(_ sender: Any) {
        
        guard let username = userLabel.text, userLabel.text?.count != 0 else
               {
                   errorLabel.text = "Please Enter the Username"
                   errorLabel.isHidden = false
               return
                   
               }
        guard let password = passwordLabel.text, passwordLabel.text?.count != 0 else
               {
                   errorLabel.text = "Please Enter the password"
                   errorLabel.isHidden = false
               return
                   
               }
               
        if username == "Test" , password == "Test@123"{
            self.userLabel.text = ""
            self.passwordLabel.text = ""
            errorLabel.isHidden = true
            self.transitiontoHomeView(Id: "gotohome")

        }
        else{
            errorLabel.text = "Incorrect User or Password"
                errorLabel.isHidden = false
            return
        }
            
            
 }
   
    
    
       func transitiontoHomeView(Id: String) {
           
           performSegue(withIdentifier: Id, sender: self)
       }

}

