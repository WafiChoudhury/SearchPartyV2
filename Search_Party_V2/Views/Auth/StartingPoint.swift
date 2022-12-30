//
//  LaunchView.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 5/29/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseAuthUI


struct StartingPoint: View {
    
    @State var loggedIn = false
    @State var loginIsShowing = false
    @State var createFormShowing = false
    
  
    
    var body: some View {
        
        //check loggedIn property and
        //show appropriate view
        
        if(loggedIn){
            
            ZStack{
                
                Color.indigo

                VStack(spacing:20){
                    
                    Spacer()
                    
                    Text("TLDR").foregroundColor(.white).font(.largeTitle)
                        .bold()
                        .padding(.bottom, 20)
                    

                    Button {
                        createFormShowing = true
                    } label: {
                        
                        Text("Create Account").foregroundColor(.white).bold()
                    }.sheet(isPresented: $createFormShowing, onDismiss: checkLoginState) {
                        CreateAccount()
                    }
                    
                    
                    Button {
                        
                        //enable login form
                        loginIsShowing = true
                        
                    } label: {
                        
                        Text("Sign In").foregroundColor(.white).bold()
                    }.sheet(isPresented: $loginIsShowing, onDismiss: checkLoginState){
                        LoginView()
                    }
                    Spacer()
                }
            }.ignoresSafeArea()
                .onAppear(){
                    
                    checkLoginState()
                }
        }
        
    }
    
    func checkLoginState(){
        
        loggedIn =  Auth.auth().currentUser == nil ? false : true
    }
}


