//
//  LoginInputForms.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/17/22.
//

import SwiftUI

struct SignUpInputForms: View {
    @Binding var email:String
    @Binding var password:String
    @Binding var name:String
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    var body: some View {
        
        VStack {
            
            TextField("UT Email", text: $email)
                .frame(width:UIScreen.main.bounds.width*0.75)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .autocapitalization(.none)

            TextField("Name", text: $name)
                .frame(width:UIScreen.main.bounds.width*0.75)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .frame(width:UIScreen.main.bounds.width*0.75)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .autocapitalization(.none)

        }.padding()
    }
    
   
}


