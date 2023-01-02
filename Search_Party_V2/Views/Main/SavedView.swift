//
//  MainView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/18/22.
//

import SwiftUI

struct SavedView: View {
    @ObservedObject var viewModel = PartyViewModel()
    

    var body: some View {
        
        ScrollView(showsIndicators:false){
            
            VStack(spacing: 25) {
                
                Text("Saved")
                    .bold()
                    .padding()
                    .font(.largeTitle)
                
                ForEach((0...viewModel.saved.count-1), id: \.self) {
                    PartyComponent(img: viewModel.saved[$0].image, title: viewModel.saved[$0].title, party: viewModel.saved[$0])
                }
            } .onAppear(){
                
                self.viewModel.fetchSaved()
            }.padding()
        }
        
        
        
        
    }
}

