//
//  SFSafariViewWrapper.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/26/22.
//


import SwiftUI
import SafariServices

struct SFSafariViewWrapper: View {
    var url: String
    
    
    var body: some View {
        
        
        SFSafariViewWrapper(url: URL(string: url)!)

    }
    
    struct SFSafariViewWrapper: UIViewControllerRepresentable {
        let url: URL
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
            return SFSafariViewController(url: url)
        }
        
        func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
            return
        }
    }
}

