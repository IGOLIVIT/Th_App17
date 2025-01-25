//
//  AchievementsView.swift
//  Th_App17
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI

struct AchievementsView: View {
    
    @StateObject var viewModel = AchievementsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Achievements")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
                
                if viewModel.achievements.isEmpty {
                    
                    VStack(spacing: 13) {
                        
                        Image("e1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                        
                        Text("You don't have any achievements yet. Tap + to add your first one!")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .regular))
                            .frame(width: 280)
                            .multilineTextAlignment(.center)
                        
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.achievements, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 15) {
                                        
                                        HStack {
                                            
                                            Text(index.aName ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 20, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Image(index.aCat ?? "")
                                                .resizable()
                                                .renderingMode(.template)
                                                .foregroundColor(Color("prim"))
                                                .frame(width: 20, height: 20)
                                        }
                                        
                                        Text((index.aDate ?? Date()).convertDate(format: "dd.MM.YYYY"))
                                            .foregroundColor(.gray.opacity(0.6))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text("Importance")
                                            .foregroundColor(.black)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                        HStack {
                                            
                                            if index.aImp ?? "" == "1" {
                                                
                                                HStack {
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star")
                                                        .foregroundColor(.orange)
                                                }
                                                
                                            } else if index.aImp == "2" {
                                                
                                                HStack {
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star")
                                                        .foregroundColor(.orange)
                                                }
                                                
                                            } else if index.aImp == "3" {
                                                
                                                HStack {
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star")
                                                        .foregroundColor(.orange)
                                                }
                                                
                                            } else if index.aImp == "4" {
                                                
                                                HStack {
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star")
                                                        .foregroundColor(.orange)
                                                }
                                                
                                            } else {
                                                
                                                HStack {
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                    
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.orange)
                                                }
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedAch = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDelete = true
                                                }
                                                
                                            }, label: {
                                                
                                                Image(systemName: "trash")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 16, weight: .regular))
                                            })
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            
                                            Text("Note")
                                                .foregroundColor(.black)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Text(index.aNot ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim").opacity(0.1)))
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                            }
                        }
                    }
                }
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                        .padding(12)
                        .background(Circle().fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
        }
        .onAppear {
            
            viewModel.fetchAchs()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddAch(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Delete \(viewModel.selectedAch?.aName ?? "")?")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)

                    Rectangle()
                        .fill(.gray.opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteAch(withAName: viewModel.selectedAch?.aName ?? "", completion: {
                                
                                viewModel.fetchAchs()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    AchievementsView()
}
