//
//  LoadingView.swift
//  Th_App17
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140)
                 
                    VStack {
                        
                        Spacer()
                        
                        ProgressView()
                            .padding(.bottom, 60)
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
