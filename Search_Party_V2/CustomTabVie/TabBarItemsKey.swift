//
//  TabBarItemsKey.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/2/22.
//

import Foundation
import SwiftUI

struct TabBarItemsKey: PreferenceKey{
    
    
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifier: ViewModifier{
    
    @Binding var selection: TabBarItem
    let tab: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarItemsKey.self, value: [tab])
    }
}

extension View{
    
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View{
        
        modifier(TabBarItemViewModifier(selection: selection, tab: tab))
        
    }
}
