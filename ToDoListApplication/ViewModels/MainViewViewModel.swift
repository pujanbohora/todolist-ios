//
//  MainViewViewModel.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/5/24.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        // [weak self] -> to prevent from memory leak
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            // main thread
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            
            }
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}

