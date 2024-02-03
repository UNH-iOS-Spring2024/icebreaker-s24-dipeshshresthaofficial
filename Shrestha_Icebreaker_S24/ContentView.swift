//
//  ContentView.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var firstName: String
    @State var lastName: String
    @State var prefName: String
    @State var answer: String
    @State var selectedOption = 0
    
    let options: [String] = ["What is your favourite color?","What do you like to do during your spare time?","What is your aim?"]
    var body: some View {
        VStack {
            HStack {
                TextField("First Name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                    .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
                    .cornerRadius(2)
                TextField("Last Name",text: $lastName)
                    .textFieldStyle(.roundedBorder)
                    .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/)
                    .cornerRadius(2)
            }
            TextField("Preferred Name", text: $prefName)
                .textFieldStyle(.roundedBorder)
                .border(Color.gray)
                .cornerRadius(2)
            Picker("Select a Question", selection: $selectedOption){
                ForEach(0 ..< options.count){
                    Text(self.options[$0])
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            TextField("Your answer", text: $answer)
                .textFieldStyle(.roundedBorder)
                .cornerRadius(2)
                .border(Color.gray)
                .padding(.bottom, 10)
            Button(action: {
                
            }){
                Text("Submit")
                    .frame(width: 340)
                    .padding(.vertical, 5)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        Spacer()
        Spacer()
        
    }
}

#Preview {
    ContentView(firstName: "", lastName: "", prefName: "", answer: "")
}
