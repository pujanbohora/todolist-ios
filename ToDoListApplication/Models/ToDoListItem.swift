//
//  ToDoListItem.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/5/24.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    
    var isDone: Bool //isDone is var so it can be mutable
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
