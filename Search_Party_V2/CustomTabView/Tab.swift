//
//  TabView.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/15/22.
//

import SwiftUI
import FirebaseAuth

struct Tab: View {
    
    @State private var tabSelection: TabBarItem = .home
    @ObservedObject private var viewModel = PartyViewModel()
    @State var selection = 2
    
    var body: some View {
        
        TabView(selection: $selection){
            
            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "star.fill")
                }
                .tag(1)
                .navigationBarBackButtonHidden(true)
                
            
            
            MainView()
                .tabItem {
                    Label("Main", systemImage: "house.fill")
                }.tag(2)
                .navigationBarBackButtonHidden(true)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }      .navigationBarBackButtonHidden(true)
                .tag(3)
            
            
            
        }
       
        
    }
    
    
}



