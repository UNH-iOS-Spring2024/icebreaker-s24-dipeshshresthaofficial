//
//  ContentView.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var prefName: String = ""
    @State private var answer: String = ""
    @State private var selectedOption = 0
    
    let options: [String] = ["What is your favourite color?","What do you like to do during your spare time?","What is your aim?"]
    var body: some View {
        VStack {
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
                // Logic to push it into database
                print("Printing User info in console:")
                print("User Info:\n First Name: \(firstName)\n LastName: \(lastName)\n Preferred Name: \(prefName)\n Question: \(options[selectedOption])\n Answer: \(answer)")
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
}

#Preview {
    ContentView()
}
