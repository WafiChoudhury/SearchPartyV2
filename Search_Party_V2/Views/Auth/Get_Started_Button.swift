//
//  Get_Started_Button.swift
//  Search_Party_V2
//
//  Created by Wafi Choudhury on 12/16/22.
//

import SwiftUI

struct Get_Started_Button: View {
    @State var willMoveToNextScreen = false;

    var body: some View {
        
        VStack{
            Spacer()
            Text("Find UT Austin Parties")
                .font(.title)
                .bold()
            
            Spacer()
            Text("Find parties you want to go to and get paid for hosting parties through the app.")
                    .italic()
                    .foregroundColor(.black)
                    .padding()
                    .lineLimit(3)
            Spacer()
            
            NavigationLink(destination: LoginView()) {
                
                ZStack{
                    
                    Rectangle()
                        .fill(.black)
                        .cornerRadius(20)
                        .frame(width: 350.0, height: 50.0)
                    
                    Text("GET STARTED")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            Spacer()
        }.padding(.top)

        }
        
    
}

struct Get_Started_Button_Previews: PreviewProvider {
    static var previews: some View {
        Get_Started_Button()
    }
}
extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
