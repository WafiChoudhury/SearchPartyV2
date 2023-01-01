//
//  PurchasePartyView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/30/22.
//

import SwiftUI
import FirebaseAuth
import Firebase
struct PurchasePartyView: View {
    
    @Binding var showing: Bool
    @State var party: PartyModel
    var body: some View {
        
        VStack{
            Spacer()
            VStack(spacing:50){
                
                Text("This Party is Free!")
                    .font(.title)
                    .bold()
                Text("RSVP the party to indicate you are coming")
                    .font(.subheadline)
                
                Text("You can un-RSVP at any time")
                    .font(.subheadline)
            }
            Spacer()
            Button {
                showing = false
                updatePeopleGoing()
            } label: {
                
                ZStack{
                    Rectangle()
                        .frame(width:UIScreen.main.bounds.width*0.8, height:UIScreen.main.bounds.height*0.05)
                        .foregroundColor(Color("green-ish"))
                        .cornerRadius(10)
                    HStack(spacing:20){
                        
                        Text("RSVP")
                        Image(systemName: "cart")
                    }.foregroundColor(.white)
                    
                    
                }
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
        .background(Color("off-white"))
        
    }
    
    
    func updatePeopleGoing(){
        
        
        let db = Firestore.firestore()
        let partiesRef = db.collection("Parties")
        
        let currentUserRef = partiesRef.document(party.id)

        currentUserRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let property = document.get("attendees")
                currentUserRef.updateData(["attendees": (property as! Int+1)])
                
                print(property)
                
            } else {
                print("error")
            }
        }
        
        
        
    }
    
    
}



