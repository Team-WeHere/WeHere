//
//  EditProfile.swift
//  WeHere
//
//  Created by Inho Choi on 2022/11/28.
//

import SwiftUI

struct EditProfileView: View {
    @Binding var showModal: Bool
    @Binding var userName: String
    @Binding var image: String
    
    @State var isChange = false
    @State var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: Title & X 버튼
            ZStack {
                HStack {
                    Spacer()
                    Text("프로필 정보 수정")
                    Spacer()
                }
                .padding(.bottom, 8)
                
                HStack {
                    Spacer()
                    Button(action: {
                        showModal.toggle()
                    }, label: {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                            .frame(width: 30, height: 30)
                    })
                }
            }
            
            // MARK: 닉네임
            Text("닉네임")
                .font(.theme.headline)
                .foregroundColor(.gray02)
                .padding(.top, 36)
            
            HStack {
                TextField("", text: $userName)
                    .onChange(of: userName) { _ in
                        if userName.count > 8 {
                            let endIndex = userName.index(userName.startIndex, offsetBy: 8)
                            userName = String(userName[userName.startIndex..<endIndex])
                        }
                        isChange = true
                    }
                    .font(.theme.body1)
                    .foregroundColor(.gray01)
                    .padding(.leading, 10)
                
                Text("\(userName.count) / 8")
                    .foregroundColor(.gray02)
                    .font(.theme.body2)
            }
            .padding(.top, 21)
            
            Divider()
                .padding(.top, 11)
            
            // MARK: 프로필 사진
            Text("프로필 사진")
                .foregroundColor(.gray02)
                .font(.theme.headline)
                .padding(.top, 30)
            
            HStack(spacing: 40) {
                Button(action: {
                    image = "woman"
                    isChange = true
                }, label: {
                    Image("woman")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                })
                .frame(width: 81, height: 81)
                
                Button(action: {
                    image = "man"
                    isChange = true
                }, label: {
                    Image("man")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
    
                })
                .frame(width: 81, height: 81)
            }
            .padding(.top, 20)
            
            Spacer()
            
            // MARK: 버튼
            Button(action: {
                showAlert.toggle()
            }, label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(isChange ? .pink02 : .gray05)
                        .cornerRadius(30)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 56)
                    
                    Text("변경하기")
                        .font(.theme.body1)
                        .foregroundColor(isChange ? .white : .gray03)
                }
            })
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("알림"),
                  message: Text("프로필을 수정할까요?"),
                  primaryButton: .default(Text("네")) {
                showModal.toggle()
            },
                  secondaryButton: .default(Text("아니오")) {
                showAlert.toggle()
            })
        })
    }
}
