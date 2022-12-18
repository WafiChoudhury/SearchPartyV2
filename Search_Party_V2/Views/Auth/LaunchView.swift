//
//  LaunchView.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/16/22.
//

import SwiftUI

struct LaunchView: View {
    
    
    var body: some View {
        NavigationView{
        
        VStack{
            
            Image("lighthouse")
                .resizable()
                .frame(width: 162.0, height: 208.0)
                .padding()
            
            Spacer()
            
            
            ZStack{
                GeometryReader { geometry in
                    VStack{
                        Spacer()
                            .frame(height: geometry.size.height*0.1)
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(40)
                        
                    }
                }
                .padding(.top)
                .ignoresSafeArea()
                
                
                Get_Started_Button()
                    .padding()
            }
        }
        .background(Color("purple"))
    }
    }
}
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
