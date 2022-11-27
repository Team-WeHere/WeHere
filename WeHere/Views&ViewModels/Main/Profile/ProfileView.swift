//
//  ProfileView.swift
//  WeHere
//
//  Created by Inho Choi on 2022/11/19.
//

import SwiftUI

struct ProfileView: View {
    @State var countDay: Int = 508 // TODO: Firebase 연동 @Toby
    @State var partnerName = "푸린"
    @State var countCock = 1508
    @State var showModal = false
    @State var userName = "우리요기"
    @State var image = "man"
    var body: some View {
        VStack {
             Text("연결한지 \(countDay)일이 지났어요!")
                .font(.theme.title1)
                .foregroundColor(.gray) // TODO: 색상 넣기 @Toby
                .padding(.top, 34)
            
            Text("'\(partnerName)'님과 \(countCock)개의 콕을 주고 받았어요")
                .font(.theme.body1)
                .foregroundColor(.gray) // TODO: 색상 넣기 @Toby
                .padding(23)
            
            HStack(spacing: 20) {
                profileImage()
                    .onTapGesture {
                        showModal.toggle()
                    }
                    .sheet(isPresented: $showModal) {
                        EditProfileView(showModal: $showModal, userName: $userName, image: $image)
                    }
                profileImage() 
            }
            .padding(.horizontal, 16)
            
            Spacer()
        }
    }
}

private extension ProfileView {
    func profileImage() -> some View { // 추후에 매개변수로 이미지를 불러올 것이기에 함수형으로 선언하였습니다.
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray)
                .frame(width: 169, height: 171)
            
            HeartView()
                .frame(width: 80, height: 75)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
 
