//
//  ViewController.swift
//  Week4
//
//  Created by Charlie Botello on 4/15/21.
//

import UIKit

class ViewController: UIViewController {

    var server: Server = Server()
    var loginTitle: String?
    
    
    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var currentPasswordTextField: UITextField!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var passwordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        responseLabel.frame = CGRect(x: 7, y: 500, width: 400, height: 100)
        responseLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        responseLabel.numberOfLines = 1
        
        userNameLabel.alpha = 0
        currentPasswordTextField.alpha = 0
        newPasswordTextField.alpha = 0
        
        passwordButton.alpha = 0
        
        
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let loginResponse :(success: Bool, message: String) = server.login(userName: userNameTextfield.text, password: passwordTextField.text)
        if loginResponse.success {
            responseLabel.textColor = .blue
            
        } else {
            responseLabel.textColor = .red
        }
    
        responseLabel.text = loginResponse.message
        
        print(userNameTextfield.text!)
    }
    
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        let logoutResponse :(success: Bool, message: String) = server.logout()
        
        if logoutResponse.success {
            responseLabel.textColor = .blue
        } else {
            responseLabel.textColor = .red
        }
        responseLabel.text = logoutResponse.1
        
        
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let registerResponse :(success: Bool, message: String) = server.createNewUser(userName: userNameTextfield.text, password: passwordTextField.text)
        
        
        if registerResponse.success {
            responseLabel.textColor = .blue
        } else {
            responseLabel.textColor = .red
        }
        responseLabel.text = registerResponse.message
        print(passwordTextField.text!)
    }
    
    
    @IBAction func updatePasswordButtonPressed(_ sender: UIButton) {
    }
}

