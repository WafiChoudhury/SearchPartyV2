//
//  LoginView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/17/22.
//

import SwiftUI
import FirebaseFirestore
import Firebase
struct CreateAccount: View {
    
    
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @State private var signedIn: Bool = false
    private var wd = 0.0
    var id = UUID().uuidString
    var body: some View {
        
        
        VStack(alignment:.center, spacing: 30){
            Text("Sign Up")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
            
            Text("Enter your email and password")
                .font(.subheadline)
                .foregroundColor(Color(#colorLiteral(red: 0.66, green: 0.65, blue: 0.65, alpha: 1))).multilineTextAlignment(.center)
            
            SignUpInputForms(email: $email, password: $password, name: $name)
            
            NavigationLink(destination: Tab(), isActive: $signedIn) { EmptyView() }
            
            Button {
                createAccount()
                
            } label: {
                ZStack{
                    Text("")
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(#colorLiteral(red: 0.13333334028720856, green: 0.13333334028720856, blue: 0.13333334028720856, alpha: 1)))
                        .frame(width:UIScreen.main.bounds.width*0.8, height: 44).padding()
                    Text("Sign Up")
                        .foregroundColor(.white)
                    
                }
                
            }
         
            
        }
        
    }
    func createAccount(){
         
         Auth.auth().createUser(withEmail: email, password: password){ result, error in
             
             let collection = Firestore.firestore().collection("users")
             let new_user = User(
                name: name, email: email, saved: [], purchased: [], id: id
             )
             collection.document(result?.user.uid ?? id).setData(new_user.dictionary)

             DispatchQueue.main.async {
                 if(error == nil){
                     signedIn = true
                 }
                 else{
                     
                     let errorMessage = error?.localizedDescription
                     print(errorMessage)
                 }
             }
         }
         
         
     }
}

