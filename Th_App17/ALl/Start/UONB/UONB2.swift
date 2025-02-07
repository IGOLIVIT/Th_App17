//
//  UONB2.swift
//  Th_App17
//
//  Created by IGOR on 07/02/2025.
//

import SwiftUI
import StoreKit

struct UONB2: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("Rev")
                        .resizable()
                        .ignoresSafeArea()
                 
                    VStack {
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text("Rate our app in the AppStore!")
                                .foregroundColor(.black)
                                .font(.system(size: 28, weight: .semibold))
                            
                            Text("Help us to become better. We work for you.")
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
            .ignoresSafeArea()
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    UONB2()
}
