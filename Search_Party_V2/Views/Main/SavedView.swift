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
                
                
                
                
                if (viewModel.saved.count != 0) {
                  
                
                    ForEach((0..<viewModel.saved.count), id: \.self) {
                        PartyComponent(img: viewModel.saved[$0].image, title: viewModel.saved[$0].title, party: viewModel.saved[$0])
                        
                    }
                    
                }
                else{
                    
                    Text("Save some parties!")
                }
                
                
            }
            .onAppear(){
            self.viewModel.fetchSaved()
            }
            .padding()
        }
        
        
        
        
    }
}

