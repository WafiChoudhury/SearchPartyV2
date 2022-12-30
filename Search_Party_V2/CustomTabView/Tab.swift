//
//  TabView.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/15/22.
//

import SwiftUI
import FirebaseAuth

struct Tab: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    @ObservedObject private var viewModel = PartyViewModel()
    
    var body: some View {
        
        TabView{
            
            SavedView()
                .environmentObject(viewModel)
                .tabItem {
                    Label("Saved", systemImage: "star.fill")
                }              .navigationBarBackButtonHidden(true)
            
            
            MainView()
                .environmentObject(viewModel)
                .tabItem {
                    Label("Main", systemImage: "house.fill")
                }              .navigationBarBackButtonHidden(true)
            
            SettingsView()
                .environmentObject(viewModel)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }              .navigationBarBackButtonHidden(true)
        }
        
    }
    
    
    
}
extension Tab{
    
    private var defaultTabView : some View {
        
        TabView(selection: $selection){
            
            MainView()
                .environmentObject(PartyViewModel())
                .tabItem {
                    Label("Home", systemImage: "house.fill").foregroundColor(.white)
                }
            MainView()
                .environmentObject(PartyViewModel())
                .tabItem {
                    Label("person", systemImage: "house.fill").foregroundColor(.white)
                }
            
            
            
        }
    }
    
}
