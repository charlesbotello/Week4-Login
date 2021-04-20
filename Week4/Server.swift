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
    
    func logout() -> (Bool, String) {

        if self.loggedInUser != nil {
            self.loggedInUser = nil
            return(true, "User logged out successfully")
        } else {
            return(false, "No user found, already logged out")
        }
        
    }
    
    func updatePassword(current: String, update: String) -> (Bool, String) {
        if let userFound = self.loggedInUser {
            if update.count >= requirePasswordLength && registeredUsers[userFound] == current {
                registeredUsers[userFound] = update
                return (true, "Password has been updated")
            } else if registeredUsers[userFound] != current {
                return(false, "Current password is invalid")
            } else {
                return(false, "New password is too short or empty")
            }
            
        } else {
            return (false, "Unknown error")
        }
        
    }
}
