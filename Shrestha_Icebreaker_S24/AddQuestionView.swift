//
//  AddQuestionView.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/11/24.
//

import SwiftUI
import FirebaseFirestore

struct AddQuestionView: View {
    @State var question: String
    @State var showAlertDialog: Bool = false
    @State var alertMsg: String = ""
    
    let db = Firestore.firestore()
    
    var body: some View {
        VStack{
            TextField("Question", text: $question)
                .padding()
                .background(Color.black.opacity(0.06))
                .cornerRadius(8)
            Button{
                // Push Question to Database
                addQuestionToDB()
            }label: {
                Text("Submit")
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
        .alert(isPresented: $showAlertDialog, content: {
            Alert(title: Text("Submission Status"),message: Text(alertMsg), dismissButton: .default(Text("Ok")))
        })
        .navigationTitle("Add Question")
    }
    
    // logic to add question to database
    func addQuestionToDB(){
        if(question.isEmpty){
            print("DEBUG: Question field cannot be empty")
            alertMsg = "Question field cannot be empty"
            showAlertDialog = true
            
        }else{
            // creating a dictionary for Question Model
            let mQuestion = [
                "id": "",
                "text": question
            ]
            // creating a reference to Question Model
            let questionRef = Question(id: "", data: mQuestion)
            do{
                // encoding question ref to make it compatible to store in firebase
                var encodedQuestion = try Firestore.Encoder().encode(questionRef)
                // pushing new question to database
                try db.collection("questions").addDocument(data: encodedQuestion)
                
                // activate Alert Diaglogue box
                alertMsg = "Question has been successfully submitted to the database."
                showAlertDialog = true
                
                // reset the form fields
                resetForm()
                
            }catch{
                
            }
        }
        
        // Logic to reset question form fields
        func resetForm(){
            question = ""
        }
    }
}

#Preview {
    AddQuestionView(question: "")
}
