//
//  LoginView.swift
//  WeHere
//
//  Created by Inho Choi on 2022/11/20.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import FirebaseAuth

struct LoginView: View {
    @State var pageIndex = 1
    @State var isLogin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $pageIndex) {
                    firstPage
                        .tag(1)
                    secondPage
                        .tag(2)
                    thirdPage
                        .tag(3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.gray02)
                    UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.gray05)
                }
                loginButtons
                    .padding(.bottom, 51)
            }
        }
    }
}

// MARK: OnboardingPages
private extension LoginView {
    var firstPage: some View {
        VStack(alignment: .center) {
            Text("연인을 콕! 찔러\n데이트 장소를 공유해요")
               .multilineTextAlignment(.center)
               .font(.theme.title2)
               .foregroundColor(.gray02)
            
            Image("loginmockup1")
                .resizable()
                .scaledToFit()
                .frame(width: 205, height: 231)
                .padding(.top, 58)
        }
    }
    
    var secondPage: some View {
        VStack(alignment: .center) {
            Text("지도 위에 핀을 찍어\n소중한 추억을 간직해요")
                .multilineTextAlignment(.center)
                .font(.theme.title2)
                .foregroundColor(.gray02)
            
            Image("loginmockup2")
                .resizable()
                .scaledToFit()
                .padding(.top, 101)
                .padding()
        }
    }
    
    var thirdPage: some View {
        VStack(alignment: .center) {
            Text("온 세상에 우리 추억이 가득하도록\n 우리요기와 함께해요")
                .multilineTextAlignment(.center)
                .font(.theme.title2)
                .foregroundColor(.gray02)
            
            Image("loginmockup3")
                .frame(width: 153, height: 153)
        }
    }
}

private extension LoginView {
    var loginButtons: some View {
        VStack(spacing: 14) {
            Button(action: {
                kakaoLogin()
            }, label: {
                Image("SignInWithKakao")
            })
            
            Button(action: {
                FirebaseManager.shared.touchUpAppleButton {
                    self.isLogin = true
                    print("HELLO")
                }
            }, label: {
                Image("SignInWithApple")
            })
        }
        .navigationDestination(isPresented: $isLogin, destination: { MainView() })
    }
    
    func kakaoLogin() {
        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
            if let oauthToken = oauthToken {
                Task {
                    if let uid = oauthToken.idToken, !(try await FirestoreDAO.shared.isUserSignIn(userID: uid)) {
                        let user = User(id: uid, email: nil, partnerID: nil)
                        try await FirestoreDAO.shared.createUser(user: user)
                        FirestoreDAO.shared.user = user
                    }
                }
                self.isLogin = true
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
