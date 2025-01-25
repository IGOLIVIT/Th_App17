//
//  R2.swift
//  Th_App17
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("R2")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text("Track Your Participation")
                                .foregroundColor(.black)
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text("Add participation details and discover the most popular events you’ve joined.")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                                .padding(.bottom, 20)
                            
                            NavigationLink(destination: {
                                
                                R3()
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
    R2()
}
