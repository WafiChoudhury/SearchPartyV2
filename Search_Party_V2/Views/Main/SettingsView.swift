//
//  LoginView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/17/22.
//

import SwiftUI
import Firebase
struct SettingsView: View {
    
    
    @State var email = ""
    @State var password = ""
    @State private var signedIn: Bool = false
    private var wd = 0.0
    var body: some View {
        
        List {
            // first section
            Section(header: Text("Change Password")) {
                NavigationLink(destination: EmptyView(), label: {
                    SettingRowView(title: "My Account",
                                   systemImageName: "person")
                })
            }
            
            // second section
            Section(header: Text("More Features")) {
                NavigationLink(destination: EmptyView(), label: {
                    SettingRowView(title: "View Purchased Parties",
                                   systemImageName:"cart")
                })
                
              
                NavigationLink(destination: LaunchView().navigationBarBackButtonHidden(true), label: {
                    SettingRowView(title: "LogOut",
                                   systemImageName: "arrowshape.turn.up.forward")
                    
                }).onAppear(){
                    logOut()

                }
                
            }
            // and more sections below ....
        }
        
        
        
        
        /*
         
         
         VStack(){
         
         NavigationLink(destination: LaunchView(), isActive: $signedIn) { EmptyView() }
         
         Button {
         logOut()
         
         } label: {
         ZStack{
         
         RoundedRectangle(cornerRadius: 20)
         .fill(Color(#colorLiteral(red: 0.13333334028720856, green: 0.13333334028720856, blue: 0.13333334028720856, alpha: 1)))
         .frame(width:    UIScreen.main.bounds.width*0.8, height: 44).padding()
         Text("Logout")
         .foregroundColor(.white)
         
         }
         
         }
         
         
         
         }
         */
    }
    func logOut(){
        
        
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    
}



