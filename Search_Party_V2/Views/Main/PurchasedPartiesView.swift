//
//  PurchasedPartiesView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 1/5/23.
//

import SwiftUI

struct PurchasedPartiesView: View {
    var body: some View {
        
        VStack{
        Text("No Purchased Parties Yet")
            .font(.largeTitle)
            .bold()
            Spacer()
        }
    }
}

struct PurchasedPartiesView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasedPartiesView()
    }
}
