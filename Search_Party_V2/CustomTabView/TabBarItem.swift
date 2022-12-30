//
//  TabBarItem.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/2/22.
//
import SwiftUI
import Foundation

enum TabBarItem: Hashable{
    
    case home, favorites, profile
    
    var iconName: String{
        
        switch self{
            
        case .home: return "house"
        case .favorites: return "magnifyingglass"
        case .profile: return "person"
        }
    }
    
    var title: String{
        
        switch self{
            
        case .home: return ""
        case .favorites: return ""
        case .profile: return ""
        }
    }
    
    var color: Color{
        
        switch self{
            
        case .home: return Color.blue
        case .favorites: return Color.blue
        case .profile: return Color.blue
        }
    }
}
