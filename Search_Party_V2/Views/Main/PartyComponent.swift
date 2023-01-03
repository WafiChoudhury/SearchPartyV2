//
//  PartyComponent.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/18/22.
//

import SwiftUI

struct PartyComponent: View {
    
    @State private var showDirections = false
    var img: String
    var title: String
    var party: PartyModel
    var body: some View {
        
        NavigationLink {
            RsvpView(party: party)
        } label: {
            
            ZStack{
                
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width*0.80, height: UIScreen.main.bounds.width*0.45)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                
                
                
                HStack(spacing:40){
                    
                    Image(img)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: UIScreen.main.bounds.width*0.35, height: UIScreen.main.bounds.width*0.35)
                        .padding(3) // Width of the border
                        .background(Color.primary) // Color of the border
                        .cornerRadius(10) // Outer corner radius
                    
                    VStack(alignment:.leading, spacing:15){
                        
                        Text(title)
                            .foregroundColor(.black)
                            .bold()
                        
                       Text("9:00 PM")
                            .bold()
                            .foregroundColor(.black)
                        
                        Button {
                            showDirections = true
                            
                        } label: {
                            ZStack{
                                Rectangle()
                                    .frame(width:90.0, height: 25.0)
                                    .cornerRadius(9)
                                    .foregroundColor(Color("blueish"))
                                
                                HStack{
                                    Text("Find it")
                                        .foregroundColor(Color("dark-purple"))
                                        .bold()
                                    Image(systemName: "location.fill")
                                }
                                
                                .foregroundColor(.black)
                                
                            }
                            
                        }.sheet(isPresented: $showDirections, content: {
                            DirectionsView(party: party)
                        })
                        
                        
                    }
                }.padding()
            }
        }
    }
    
    
}
    
    
