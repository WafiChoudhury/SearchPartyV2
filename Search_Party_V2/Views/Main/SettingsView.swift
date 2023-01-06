//
//  LoginView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/17/22.
//

import SwiftUI
import Firebase
struct SettingsView: View {
    @State private var showSafari: Bool = false
    
    @State var email = ""
    @State var password = ""
    @State private var signedIn: Bool = false
    private var wd = 0.0
    var body: some View {
        
        
        
        List {
            // first section
            Section(header: Text("Account Prefrences")) {
                NavigationLink(destination: AccountView(), label: {
                    SettingRowView(title: "My Account",
                                   systemImageName: "person")
                })
            }
            
            // second section
            Section(header: Text("More Features")) {
                NavigationLink(destination: PurchasedPartiesView(), label: {
                    SettingRowView(title: "View Purchased Parties",
                                   systemImageName:"cart")
                })
                
               
                //privacy policy
                Button(action: {
                    showSafari.toggle()
                }) {
                    
                    SettingRowView(title: "Privacy",
                                   systemImageName: "doc.text.magnifyingglass")
                    
                }
                .fullScreenCover(isPresented: $showSafari, content: {
                    SFSafariViewWrapper(url:"https://www.termsfeed.com/live/76c42150-6760-4432-96cd-b2abcc7e6ca5")
                })
                .foregroundColor(.black)
                
                
                //headline: policy
                
                Button(action: {
                    showSafari.toggle()
                }) {
                    
                    SettingRowView(title: "Terms and Conditions",
                                   systemImageName: "list.bullet.rectangle.portrait")
                    
                }
                .fullScreenCover(isPresented: $showSafari, content: {
                    SFSafariViewWrapper(url:"https://www.termsfeed.com/live/2d6e9d42-8236-46a2-a802-b844d82d899e")
                })
                .foregroundColor(.black)
                
                NavigationLink(destination: LaunchView().navigationBarBackButtonHidden(true), label: {
                    SettingRowView(title: "Log Out",
                                   systemImageName: "arrowshape.turn.up.forward")
                    
                }).onAppear(){
                    logOut()
                    
                }
                
            }
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



