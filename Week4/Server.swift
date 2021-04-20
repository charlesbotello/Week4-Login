//
//  Server.swift
//  Week4
//
//  Created by Charlie Botello on 4/15/21.
//

import Foundation

class Server {
    var registeredUsers: [String : String] = [:]  // Key will be username Value will be password
    var loggedInUser: String?
    var requirePasswordLength: Int = 8
    
    
    func createNewUser(userName: String?, password: String?) -> (Bool, String) {
        
        if let userName = userName, let password = password, !userName.isEmpty, !password.isEmpty {
            if registeredUsers[userName] == nil {
                if password.count >= requirePasswordLength {
                    registeredUsers[userName] = password
                    return (true, "User succesfully registered")
                } else {
                    return (false, "Password is to short")
                }
            } else {
                return (false, "Usernmae already registed")
            }
        }
        return (false, "Username or Password is not present")
    }
    
    func login(userName: String?, password: String?) -> (Bool, String) {
        if let userName = userName, let password = password, !userName.isEmpty, !password.isEmpty {
        
            if let storedPasswortd = registeredUsers[userName] {
                if storedPasswortd == password {
                    loggedInUser = userName
                    return(true, "user logged in successfully")
                } else {
                    return(false, "Password Incorrect")
                }
            } else {
                return (false, "User not present")
            }
        }
        return(false, "Username or Password is not present")
    }
}
