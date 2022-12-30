//
//  CustomTabBarView.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 6/28/22.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    var body: some View {
        
        
        HStack{
            
            ForEach(tabs, id:\.self) { tab in
                
                tabView(tab: tab).onTapGesture {
                    switchTab(tab: tab)
                }
                
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges:.bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

extension CustomTabBarView{
    
    private func tabView(tab: TabBarItem) -> some View{
        
        VStack{
            
            Image(systemName: tab.iconName)
                .font(.subheadline)
            
        }
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth:.infinity)
        .background(
            ZStack{
                
                if selection == tab {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rect", in: namespace)
                }
                
            }
        )
    }
    
    private func switchTab(tab: TabBarItem){
        
        withAnimation(.easeInOut){
            
            selection = tab
        }
    }
    
}


