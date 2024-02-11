//
//  UserDataListView.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/9/24.
//

import SwiftUI

struct UserDataListView: View {
    var users: [UserData]
    
    var body: some View {
            List{
                ForEach(users) { user in
                    NavigationLink{
                        UserDataDetailView(user: user)
                    }label: {
                        UserDataRowView(user: user)
                    }
                }
            }
            .navigationTitle("Users")
    }
}

#Preview {
    UserDataListView(users: [])
}
