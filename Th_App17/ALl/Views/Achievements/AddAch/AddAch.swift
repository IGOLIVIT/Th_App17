//
//  AddAch.swift
//  Th_App17
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI

struct AddAch: View {
    
    @StateObject var viewModel: AchievementsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New achievement")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 35)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 14) {
                        
                        Text("Achievement category")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentCategory = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index)
                                        
                                        Text(index)
                                    }
                                })
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(viewModel.currentCategory)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                
                                Text(viewModel.currentCategory)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        Text("Achievement name")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.aName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.aName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Date")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                
                                DatePicker("", selection: $viewModel.aDate, displayedComponents: .date)
                                    .labelsHidden()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Importance")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                
                                HStack {
                                    
                                    ForEach(1...5, id: \.self) { star in
                                        
                                        Button(action: {
                                            
                                            viewModel.startStar = star
                                            
                                        }, label: {
                                            
                                            Image(systemName: star <= viewModel.startStar ? "star.fill" : "star")
                                                .foregroundColor(.orange)
                                        })
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        Text("Note (optional)")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.aNot.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.aNot)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                            .padding(.bottom, 50)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button(action: {
                        
                        viewModel.aCat = viewModel.currentCategory
                        viewModel.aImp = String(viewModel.startStar)
                        
                        viewModel.addAch()
                        
                        viewModel.startStar = 1
                        viewModel.aName = ""
                        viewModel.aNot = ""
                        
                        viewModel.fetchAchs()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save & add")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .padding(.horizontal, 40)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                    })
                    .opacity(viewModel.aName.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.aName.isEmpty ? true : false)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddAch(viewModel: AchievementsViewModel())
}
