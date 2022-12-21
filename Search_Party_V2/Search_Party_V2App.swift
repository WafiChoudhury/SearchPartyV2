//
//  Search_Party_V2App.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/16/22.
//

import SwiftUI
import Firebase

@main
struct Search_Party_V2App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}
