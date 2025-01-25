//
//  R3.swift
//  Th_App17
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("R3")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text("Let’s Get Started!")
                                .foregroundColor(.black)
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text("Customize your experience and start tracking your journey today.")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                                .padding(.bottom, 20)
                            
                            Button(action: {
                                
                                status = true
                                
                            }, label: {
                                
                                Text("Start")
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
    R3()
}
