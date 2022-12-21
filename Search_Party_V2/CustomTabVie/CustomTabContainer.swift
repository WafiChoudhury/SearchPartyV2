//
//  CustomTabContainer.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 6/28/22.
//

//container view for tab bar view and main view

import SwiftUI


struct CustomTabContainerView<Content:View>: View {
    
    let content: Content
    @Binding var selection: TabBarItem
    @State private var tabs: [TabBarItem] = []
    
     init(selection: Binding<TabBarItem>?, @ViewBuilder content: () -> Content){
        
         self._selection = selection!
         self.content = content()
    }
    

    var body: some View {
       
        ZStack(alignment: .bottom){
            
            content
            CustomTabBarView(tabs: tabs, selection: $selection)

        }
        .onPreferenceChange(TabBarItemsKey.self) { value in
            
            self.tabs = value
        }
        
        
    }
}

