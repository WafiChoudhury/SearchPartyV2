//
//  AccountView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 1/3/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct AccountView: View {
  
    var body: some View {
        
        VStack(spacing:50){
            
            

            Text("Account")
                .font(.largeTitle)
                .bold()
  
            Button {
                
              doDelete()
            } label: {
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:UIScreen.main.bounds.width*0.60, height:UIScreen.main.bounds.height*0.08)
                        .foregroundColor(.red)
                    
                    Text("Delete Account")
                        .foregroundColor(.white)
                }
            }
            Spacer()
        }
       
        
    }
    
    func getName() -> String {
        var name = ""
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(Auth.auth().currentUser?.uid ?? "id")
        userRef.getDocument { (document, error) in
          if let document = document, document.exists {
              name = document.data()?["name"] as? String ?? ""
              print("name is \(name)")
          } else {
            print("Document does not exist")
          }
        }
        return name
    }
    
    func doDelete(){
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(Auth.auth().currentUser?.uid ?? "id")

        
        userRef.delete { error in
            if let error = error {
                print("Error deleting user: \(error)")
            } else {
                print("User successfully deleted!")
            }
        }
        let handle = Auth.auth().addStateDidChangeListener { auth, user in

            Auth.auth().currentUser?.delete()
            print(user?.email)
        }
    }
}
