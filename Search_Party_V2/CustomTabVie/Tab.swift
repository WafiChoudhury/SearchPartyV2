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
        
        CustomTabContainerView(selection: $tabSelection) {
            
          
            MainView()
                .environmentObject(viewModel)
                .tabBarItem(tab: .home, selection: $tabSelection)
            MainView()
                .environmentObject(viewModel)
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
        
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
