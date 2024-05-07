//
//  Extensions.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/7/24.
//

import Foundation


extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else{
            //return empty dictinary
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }catch {
            return [:]
        }
    }
}
