//
//  UserDataListView.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/9/24.
//

import SwiftUI
import FirebaseFirestore

struct UserDataListView: View {
    @State var users = [UserData]()
    
    let db = Firestore.firestore()
    
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
            .onAppear(){
                // pull user information from database on navigating to this view
                getUserDataFromDB()
            }
    }
    
    func getUserDataFromDB(){
        self.users = [] // emptying array before pulling records from database
        
        // pull data from database
        db.collection("users")
            .getDocuments(){ (querySnapshot, err) in
                if let err = err{
                    print("DEBUG: Couldn't get user documents \(err) ")
                }else{
                    for document in querySnapshot!.documents{
                        if let userData = UserData(id: document.documentID, data: document.data()){
                            self.users.append(userData)
                        }
                    }
                    
                }
                
            }
    }
}

#Preview {
    UserDataListView(users: [])
}
