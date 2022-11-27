//
//  EditProfile.swift
//  WeHere
//
//  Created by Inho Choi on 2022/11/28.
//

import SwiftUI

struct EditProfile: View {
    @Binding var showModal: Bool
    @Binding var userName: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title & X 버튼
            ZStack {
                
            }
            
            Text("닉네임")
            HStack {
                TextField("", text: $userName)
                    .onChange(of: userName) { _ in
                        if userName.count > 8 {
                            let endIndex = userName.index(userName.startIndex, offsetBy: 8)
                            userName = String(userName[userName.startIndex..<endIndex])
                        }
                    }
                
                Text("\(userName.count) / 8")
            }
            
            Text("프로필 사진")
            
            HStack {
                
            }
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile(showModal: .constant(true), userName: .constant("우리요기"))
    }
}
