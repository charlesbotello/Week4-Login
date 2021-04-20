//
//  ViewController.swift
//  Week4
//
//  Created by Charlie Botello on 4/15/21.
//

import UIKit

class ViewController: UIViewController {

    var server: Server = Server()
    
    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var responseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let loginResponse :(success: Bool, message: String) = server.login(userName: userNameTextfield.text, password: passwordTextField.text)
        if loginResponse.success {
            
            responseLabel.textColor = .blue
        } else {
            responseLabel.textColor = .red
        }
        responseLabel.text = loginResponse.message
        
        print(userNameTextfield.text!)
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
    
}

