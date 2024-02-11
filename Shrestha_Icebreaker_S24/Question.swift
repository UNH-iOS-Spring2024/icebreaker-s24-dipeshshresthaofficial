//
//  Question.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/11/24.
//

import Foundation

struct Question: Identifiable, Codable{
    var id: String
    var text: String
    
    init?(id: String, data: [String:Any]) {
        guard let question = data["text"] as? String else{
            return nil
        }
        self.text = question
        self.id = id
    }
}
