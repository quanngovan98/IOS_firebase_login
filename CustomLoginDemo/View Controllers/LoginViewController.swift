//
//  LoginViewController.swift
//  CustomLoginDemo
//
//  Created by Ngo Van Quan on 6/16/20.
//  Copyright © 2020 Ngo Van Quan. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        
    }
    
    func setUpElements(){
        errorLabel.alpha = 0;
        Utilities.styleTextField(emailTextField);
        Utilities.styleTextField(passwordTextField);
        Utilities.styleFilledButton(loginButton);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginTapped(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if err != nil {
                self.showError("Login fail")
            } else {
                self.goToHome()
            }
        }
    }
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func goToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        view?.window?.rootViewController = homeViewController
        view?.window?.makeKeyAndVisible()
    }
}
