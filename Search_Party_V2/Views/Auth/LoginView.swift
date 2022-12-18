//
//  LoginView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/17/22.
//

import SwiftUI

struct LoginView: View {
    
    
    @State private var email: String = ""
    @State private var password: String = ""
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
            
            LoginInputForms()
            
                
                Button {
                    
                } label: {
                    ZStack{
                        Text("")
                     
                                    
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(#colorLiteral(red: 0.13333334028720856, green: 0.13333334028720856, blue: 0.13333334028720856, alpha: 1)))
                            .frame(width:    UIScreen.main.bounds.width*0.9, height: 44).padding()
                        Text("Login")
                            .foregroundColor(.white)
                        
                    }
                        
                }
            
            HStack{
                Text("Don't have an account?")
                        .foregroundColor(.black)
            Button {
                
            } label: {
                
                    Text("Sign Up")
                        .foregroundColor(.indigo)
                }
            }

        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
