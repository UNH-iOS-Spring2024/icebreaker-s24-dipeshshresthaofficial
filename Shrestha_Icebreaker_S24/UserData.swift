//
//  UserData.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/7/24.
//

import Foundation

struct UserData: Identifiable, Codable{
    let id: String
    let firstName: String
    let lastName: String
    let prefName: String
    let question: String
    let answer: String
    
    init?(id: String, data: [String: Any]){
        guard let firstName = data["firstName"] as? String else{
            return nil
        }
        self.firstName = firstName
        
        guard let lastName = data["lastName"] as? String else{
            return nil
        }
        self.lastName = lastName
        
        guard let prefName = data["prefName"] as? String else{
            return nil
        }
        self.prefName = prefName
        
        guard let question = data["question"] as? String else{
            return nil
        }
        self.question = question
        
        guard let answer = data["answer"] as? String else{
            return nil
        }
        self.answer = answer
        
        self.id = id
        
    }
}
