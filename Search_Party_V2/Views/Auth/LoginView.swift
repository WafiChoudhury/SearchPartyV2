//
//  LoginView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/17/22.
//

import SwiftUI
import Firebase
struct LoginView: View {
    
    
    @State var email = ""
    @State var password = ""
    @State private var signedIn: Bool = false
    private var wd = 0.0
    var body: some View {
        
        
        VStack(alignment:.center, spacing: 30){
            Text("Sign In")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
            
            Text("Enter your email and password")
                .font(.subheadline)
                .foregroundColor(Color(#colorLiteral(red: 0.66, green: 0.65, blue: 0.65, alpha: 1))).multilineTextAlignment(.center)
            
            LoginInputForms(email: $email, password: $password)
            
            NavigationLink(destination: Tab()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true), isActive: $signedIn) { EmptyView() }
            
            Button {
                signIn()
                
            } label: {
                ZStack{
                    Text("")
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(#colorLiteral(red: 0.13333334028720856, green: 0.13333334028720856, blue: 0.13333334028720856, alpha: 1)))
                        .frame(width:    UIScreen.main.bounds.width*0.8, height: 44).padding()
                    Text("Login")
                        .foregroundColor(.white)
                    
                }
                
            }
            
            HStack{
                Text("Don't have an account?")
                    .foregroundColor(.black)
                Button {
                    
                } label: {
                    
                    NavigationLink {
                        CreateAccount()
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(.indigo)
                    }
                    
                    
                    
                }
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

        
    }
    func signIn(){
        
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            
            DispatchQueue.main.async {
                
               
                if( error == nil){
                    
                    signedIn = true
                    
                }
                else{
                    //issue with login
                    
                   let errorMessage = error?.localizedDescription
                    print("BIG ERROR")
                    
                }
            }
        }
        
    }
}

