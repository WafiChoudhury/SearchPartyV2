//
//  User.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/23/22.
//

import Foundation
struct User{
    
    var name: String
    var email: String
    var dictionary: [String: Any] {
       return [
         "name": name,
         "email": email,
  
       ]
     }
    
}
