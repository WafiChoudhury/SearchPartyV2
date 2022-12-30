//
//  SettingRowView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/28/22.
//

import SwiftUI

struct SettingRowView : View {
    var title : String
    var systemImageName : String
    
    var body : some View {
        HStack (spacing : 15) {
            Image(systemName: systemImageName)
            Text (title)
        }
    }
}
