//
//  IcebreakerMainView.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/15/24.
//

import SwiftUI
import FirebaseFirestore

struct IcebreakerMainView: View {
    @State private var showAlertText: Bool = false
    @State private var alertMsg: String = ""
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var prefName: String = ""
    @State private var answer: String = ""
    @State private var question: String = ""

    @State var questions = [Question]()
    
    let db = Firestore.firestore()
    var body: some View {
        NavigationView{
            ZStack(){
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
                    
                    Picker("Select a Question", selection: $question){
                        ForEach(questions, id: \.text){ question in
                            Text(question.text)
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
                    Spacer()
                }
                .alert(isPresented: $showAlertText, content: {
                    // Display this alert when $showAlertText is true
                    Alert(title: Text("Submission Successful"), message: Text(alertMsg), dismissButton: .default(Text("OK")))
                })
                .onAppear(){
                    // pull questions from database on navigating to this view
                    getQuestionsFromDB()
                }
                
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink{
                            UserDataListView()
                        }label: {
                            Image(systemName: "person.3.fill")
                                .font(.subheadline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                .padding(.bottom, 75)
                .padding(.horizontal,12)
                
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink{
                            AddQuestionView(question: "")
                        }label: {
                            Image(systemName: "plus")
                                .font(.title3)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .padding()
                }
            }
        }
    }
    func getQuestionsFromDB(){
        // emptying the array before adding all questions from DB
        self.questions = []
        
        db.collection("questions")
            .getDocuments() { querySnapshot, err in
                if let err = err{
                    print("DEBUG: Error in getting documents.")
                    alertMsg = "Error in getting documents."
                    showAlertText = true
                }else{
                    for document in querySnapshot!.documents{
                        if let questionData = Question(id: document.documentID, data: document.data()) {
                            self.questions.append(questionData)
                        }
                    }
                }
            }
    }
    
    func pushDataToDb(){
        // Logic to push it into database
        if(firstName.isEmpty || lastName.isEmpty || question.isEmpty || answer.isEmpty){
            print("Please complete the form to submit successfully.")
            alertMsg = "Please complete the form to submit it successfully."
            showAlertText = true
            
        }else{
            let userData = [
                "firstName": firstName,
                "lastName": lastName,
                "prefName": prefName,
                "question": question,
                "answer" : answer
            ]
            let user = UserData(id: "",data: userData)
            
            do {
                // Encoding User model data to the format that Firestore understands
                let encodedUser = try Firestore.Encoder().encode(user)
                // Pushing the encoded data to the firestore
                try db.collection("users").addDocument(data: encodedUser)
                
                // Show alert
                alertMsg = "Form Submitted Successfully."
                showAlertText = true
            } catch {
                // Handle encoding errors here
                print("Error encoding user: \(error)")
                return // or throw, depending on your context
            }
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
    IcebreakerMainView()
}
