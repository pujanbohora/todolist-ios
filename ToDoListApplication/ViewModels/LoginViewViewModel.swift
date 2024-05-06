//
//  LoginViewViewModel.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/5/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMesssage = ""
    
    init() {}
    
    
    func login(){
        guard validate() else{
            return
        }
        
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool{
        
        errorMesssage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMesssage = "Please fill in all form"
            return false
        }
        
//        email@foo.com
        guard email.contains("@") && email.contains(".") else{
            errorMesssage = "Please enter valid email"
            return false
        }
        return true
    }
    
    
}
