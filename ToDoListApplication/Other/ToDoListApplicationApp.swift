//
//  ToDoListApplicationApp.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/5/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApplicationApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
