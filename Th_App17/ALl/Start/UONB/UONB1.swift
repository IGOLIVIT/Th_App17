//
//  UONB1.swift
//  Th_App17
//
//  Created by IGOR on 07/02/2025.
//

import SwiftUI

struct UONB1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("U1")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text("Welcome to STAKE!")
                                .foregroundColor(.black)
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text("Play and earn! It's all up to you!")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                                .padding(.bottom, 20)
                            
                            NavigationLink(destination: {
                                
                                UONB2()
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                Text("Next")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 42)
                                    .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 220)
                        .background(Color.white)
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    UONB1()
}
