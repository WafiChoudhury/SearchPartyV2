//
//  MainView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/18/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = PartyViewModel()

    
    var body: some View {
        
            ScrollView(showsIndicators:false){
                
                VStack(spacing: 25) {
                    
                    Text("Parties")
                        .font(.largeTitle)
                        .bold()
                    
                    
                    ForEach((0..<viewModel.parties.count), id: \.self) {
                        
                        
                        PartyComponent(img: viewModel.parties[$0].image, title: viewModel.parties[$0].title, party: viewModel.parties[$0])
                       }
                    
                    Spacer()
                }
                .onAppear(){
                    
                    self.viewModel.fetchParties()
                    viewModel.requestGeoLocationPermission()
                }
                .padding()
            }
            
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
