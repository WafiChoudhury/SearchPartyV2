//
//  LoginInputForms.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/17/22.
//

import SwiftUI

struct LoginInputForms: View {
    @State private var email: String = ""
    @State private var password: String = ""
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

    var body: some View {
        
        VStack {
       
            TextField("Username", text: $email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
        }.padding()
    }
}


struct LoginInputForms_Previews: PreviewProvider {
    static var previews: some View {
        LoginInputForms()
    }
}
