//
//  ContentView.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/3/24.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var prefName: String = ""
    @State private var answer: String = ""
    @State private var selectedOption = 0
    
    let options: [String] = ["What is your favourite color?","What do you like to do during your spare time?","What is your aim?"]
    
    let db = Firestore.firestore()
    
    var body: some View {
        VStack {
            Image(.iceBreaker)
                .resizable()
                .frame(width: 175, height:175)
                .padding()
            HStack {
                TextField("First Name", text: $firstName)
                    .padding()
                    .frame(width: 170, height: 35)
                    .background(Color.black.opacity(0.06))
                    .cornerRadius(8)
                TextField("Last Name",text: $lastName)
                    .padding()
                    .frame(width: 170, height: 35)
                    .background(Color.black.opacity(0.06))
                    .cornerRadius(8)
            }
            .padding()
            TextField("Preferred Name", text: $prefName)
                .padding()
                .frame(width: 345, height: 35)
                .background(Color.black.opacity(0.06))
                .cornerRadius(8)
            
            Picker("Select a Question", selection: $selectedOption){
                ForEach(0 ..< options.count){
                    Text(self.options[$0])
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.top)
            
            TextField("Your answer", text: $answer)
                .padding()
                .frame(width: 345, height: 35)
                .background(Color.black.opacity(0.06))
                .cornerRadius(8)
                .padding()
            
            Button(action: {
                // push the data to Database
                pushDataToDb()
                
                // reset all the textfields
                resetTxtFields()
            }){
                Text("Submit")
                    .frame(width: 320)
                    .padding(.vertical, 5)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        Spacer()
    }
    
    func pushDataToDb(){
        // Logic to push it into database
        let user = UserData(firstName: firstName, lastName: lastName, prefName: prefName, question: options[selectedOption], answer: answer)
        
        do {
            // Encoding User model data to the format that Firestore understands
            let encodedUser = try Firestore.Encoder().encode(user)
            // Pushing the encoded data to the firestore
            try db.collection("users").addDocument(data: encodedUser)
        } catch {
            // Handle encoding errors here
            print("Error encoding user: \(error)")
            return // or throw, depending on your context
        }
    }
    
    func resetTxtFields(){
        firstName = ""
        lastName = ""
        prefName = ""
        answer = ""
    }
}

#Preview {
    ContentView()
}
