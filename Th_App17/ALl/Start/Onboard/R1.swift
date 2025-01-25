//
//  R1.swift
//  Th_App17
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("R1")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text("Achieve More, Track Better!")
                                .foregroundColor(.black)
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text("Stay on top of your achievements, grades, and participation – all in one place.")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                                .padding(.bottom, 20)
                            
                            NavigationLink(destination: {
                                
                                R2()
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
            }
        }
    }
}

#Preview {
    R1()
}
