//
//  UserDataRowView.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/9/24.
//

import SwiftUI

struct UserDataRowView: View {
    var user: UserData
    
    
    var body: some View {
        HStack{
            Text(user.firstName)
                .padding(.horizontal)
            Text(user.lastName)
        }
    }
}
