//
//  DirectionsView.swift
//  CitySightsApp
//
//  Created by Wafi Choudhury on 1/12/22.
//

import SwiftUI

struct DirectionsView: View {
    
    var party: PartyModel
    
    
    var body: some View {

        VStack(alignment:.leading){
            
            HStack{
                Text(party.title)
            Spacer()
                
                if let lat = party.latitude, let long = party.longitude,
                   let name = party.address{
                    Link(destination: URL(string: "http://maps.apple.com/?\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!, label: {
                    Text("Open in maps")
                })
                
                }
            }.padding()
            
            DirectionsMap(party: party)
                .ignoresSafeArea(.all, edges: .bottom)
            
        }


    }
}
