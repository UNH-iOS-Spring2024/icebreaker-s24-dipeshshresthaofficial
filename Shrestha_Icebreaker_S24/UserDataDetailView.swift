//
//  UserDataDetailView.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/10/24.
//

import SwiftUI

struct UserDataDetailView: View {
    var user: UserData
    var body: some View {
        VStack{
            HStack{
                Text("First Name: ")
                Text(user.firstName)
            }
            HStack{
                Text("Last Name: ")
                Text(user.lastName)
            }
            HStack{
                Text("Preferred Name: ")
                Text(user.prefName)
            }
            HStack{
                Text("Question: ")
                Text(user.question)
            }
            HStack{
                Text("Answer: ")
                Text(user.answer)
            }
        }
    }
}

