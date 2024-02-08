//
//  Shrestha_Icebreaker_S24App.swift
//  Shrestha_Icebreaker_S24
//
//  Created by Dipesh Shrestha on 2/3/24.
//

import SwiftUI
import Firebase

@main
struct Shrestha_Icebreaker_S24App: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
