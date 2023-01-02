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
        let usersRef = db.collection("users")
        
        let newUser = User(name: name, email: email)
        let data: [String: Any] = newUser.dictionary
        var party = PartyModel(image: "Omega", price: 10, title: "Omegas Party", description: "party", latitude: 0.0, longitude: 0.0, address: "some house", id: "seshsh", capacity: 100, attendees: 10)
        
        let document = usersRef.addDocument(data: data)
        document.collection("saved").addDocument(data: party.dictionary)
        


        if (email.hasSuffix(".edu")){
           
       
        
            let handle = Auth.auth().addStateDidChangeListener { auth, user in

                
                Auth.auth().createUser(withEmail: email, password: password){ result, error in
                    
                    print("success")

                    DispatchQueue.main.async {
                        if(error == nil){
                            signedIn = true
                        }
                        else{
                            
                            let errorMessage = error?.localizedDescription
                            print(errorMessage ?? "error")
                        }
                    }
                }
            }
        }
    }
}

