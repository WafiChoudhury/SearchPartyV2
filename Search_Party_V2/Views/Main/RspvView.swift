//
//  LaunchView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/16/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
struct RsvpView: View {
    @State var imageName: String = "heart"
    
    @State private var showRSPV = false
    @ObservedObject var viewModel = PartyViewModel()
    var party: PartyModel
    var body: some View {
        
        ScrollView{
            
            VStack(alignment:.leading){
                
                
                
                Image(party.image)
                    .resizable()
                    .frame(width:UIScreen.main.bounds.width*0.8,height:UIScreen.main.bounds.height*0.4)
                    .ignoresSafeArea()
                
                
                Spacer().frame(height:UIScreen.main.bounds.height*0.05)
                
                VStack(alignment:.leading, spacing:20){
                    
                    Text(party.title)
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                    Text("People Going: \(party.attendees)")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                    let price = party.price ?? 0.0
                    
                    let txt = "$" + String(price)
                    Text(txt)
                        .bold()
                        .foregroundColor(.black)
                    
                    
                    
                }
                
                Spacer().frame(height:UIScreen.main.bounds.height*0.1)
                HStack(spacing:40){
                    
                    Button {
                        addCollection()
                        self.imageName = "heart.fill"
                    } label: {
                        
                        ZStack{
                            Rectangle()
                                .frame(width:UIScreen.main.bounds.width*0.2, height:UIScreen.main.bounds.height*0.05)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                            
                            
                            
                            Image(systemName: imageName)
                                .foregroundColor(.white)
                            
                        }
                    }
                    
                    
                    Button {
                        showRSPV = true
                    } label: {
                        
                        ZStack{
                            Rectangle()
                                .frame(width:UIScreen.main.bounds.width*0.4, height:UIScreen.main.bounds.height*0.05)
                                .foregroundColor(Color("green-ish"))
                                .cornerRadius(10)
                            HStack(spacing:20){
                                
                                Text("Purchase")
                                Image(systemName: "cart")
                            }.foregroundColor(.white)
                            
                            
                        }
                    }.sheet(isPresented: $showRSPV, content: {
                        PurchasePartyView(showing:$showRSPV, party: party)
                    })
                    
                    
                }
                
                
            }.ignoresSafeArea()
            
            
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity) // 1
            .background(Color("off-white"))
    }
    
    func addCollection(){
        
        let db = Firestore.firestore()
        
        //if let currentUserID = Auth.auth().currentUser?.uid {
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            
            if Auth.auth().currentUser != nil {
                
                
                let documentRef = db.collection("users").document(Auth.auth().currentUser?.uid ?? "")
                let collectionRef = documentRef.collection("saved")
                let document = collectionRef.document(party.id ?? "id")
                let data: [String: Any] = party.dictionary
                document.setData(data)
                
                
            }
            
            else{
                
                print("man")
            }
            
        }
    }
}
