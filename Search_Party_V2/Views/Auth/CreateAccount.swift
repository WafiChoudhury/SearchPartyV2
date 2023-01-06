//
//  LoginView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/17/22.
//

import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth
struct CreateAccount: View {
    
    @State private var errorMessage: String?
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
            if(errorMessage != nil){
                Section{
                    Text(errorMessage!).frame(width:300, height:50)
                }
            }
            NavigationLink(destination: Tab().navigationBarBackButtonHidden(true), isActive: $signedIn) { EmptyView() }
            
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
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        let db = Firestore.firestore()
        
        if (email.hasSuffix(".edu")){
            
            
            
            let handle = Auth.auth().addStateDidChangeListener { auth, user in
                
                
                Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                    guard let user = authResult?.user else {
                        return
                        
                        
                    }
                    let uid = user.uid
                    // You can now use the `uid` to create a new document in Firestore
                    
                    print("success")
                    
                    
                    let newUser = User(name: name, email: email)
                    let data: [String: Any] = newUser.dictionary
                    let usersRef = db.collection("users")
                    let document = usersRef.document(uid)
                    document.setData(data)
                    
                    DispatchQueue.main.async {
                        if(error == nil){
                            signedIn = true
                        }
                        else{
                            
                            errorMessage = error?.localizedDescription
                            
                        }
                    }
                }
            }
        }
    }
}


