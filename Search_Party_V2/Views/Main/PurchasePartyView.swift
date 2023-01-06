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
        
        VStack(spacing:40){
            Spacer()
            VStack(spacing:50){
                
                Text("Purchasing parties coming soon!")
                    .font(.title2)
                    .bold()
     
                
                Text("Click the RSVP button to indicate you're coming")
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
                        Image(systemName: "square.and.arrow.down")
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
        
        let currentUserRef = partiesRef.document(party.id ?? "id")

        currentUserRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let property = document.get("attendees")
                currentUserRef.updateData(["attendees": (property as! Int+1)])
                

            } else {
                print("error")
            }
        }
        
        
        
    }
    
    
}



