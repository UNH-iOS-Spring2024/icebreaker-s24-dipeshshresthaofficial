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
        List{
            Section{
                HStack{
                    Image(systemName: "person")
                        .font(.title2)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    VStack(alignment: .leading){
                        HStack{
                            Text(user.firstName)
                            Text(user.lastName)
                        }
                        Text("xxx@gmail.com")
                            .tint(Color.gray)
                    }
                }
            }
            
            Section("Icebreaker Question"){
                HStack{
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 22))
                        .foregroundColor(Color.gray)
                    Text(user.question)
                }
            }
            
            Section("Response"){
                HStack{
                    Image(systemName: "checkmark.seal")
                        .font(.system(size: 22))
                        .foregroundColor(Color.gray)
                    Text(user.answer)
                }
            }
        }
        Spacer()
    }
}

