//
//  MainView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/18/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = PartyViewModel()
    @EnvironmentObject var model: PartyViewModel

    
    var body: some View {
        
        NavigationView{
            ScrollView(showsIndicators:false){
                
                VStack(spacing: 25) {
                    Spacer()
                    
                    ForEach((0...viewModel.parties.count-1), id: \.self) {
                        PartyComponent(img: viewModel.parties[$0].image, title: viewModel.parties[$0].title, party: viewModel.parties[$0])
                       }
                    
                    
                }
                .onAppear(){
                    
                    self.viewModel.fetchParties()
                    model.requestGeoLocationPermission()
                    print(viewModel.parties.count)
                }
                .padding()
            }
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
