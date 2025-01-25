//
//  AddPart.swift
//  Th_App17
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI

struct AddPart: View {
    
    @StateObject var viewModel: ParticipationViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New particapation")
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
                        
                        Text("Participation category")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentCat = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index)
                                        
                                        Text(index)
                                    }
                                })
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(viewModel.currentCat)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                
                                Text(viewModel.currentCat)
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
                                .opacity(viewModel.pName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.pName)
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
                                
                                DatePicker("", selection: $viewModel.pDate, displayedComponents: .date)
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
                                .opacity(viewModel.pNot.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.pNot)
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
                        
                        viewModel.pCat = viewModel.currentCat
                        viewModel.pImp = String(viewModel.startStar)
                        
                        viewModel.addPart()
                        
                        viewModel.startStar = 1
                        viewModel.pName = ""
                        
                        viewModel.fetchParts()
                        
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
                    .opacity(viewModel.pName.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.pName.isEmpty ? true : false)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddPart(viewModel: ParticipationViewModel())
}
