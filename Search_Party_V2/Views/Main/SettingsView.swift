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



