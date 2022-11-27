//
//  SNSLoginManager.swift
//  WeHere
//
//  Created by Inho Choi on 2022/11/20.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class KakaoLoginManager {
    private init() { }
    
    static let shared = KakaoLoginManager()
    
    func signInWithKakao() {
        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
            if let oauthToken = oauthToken {
                Task {
                    if let uid = oauthToken.idToken, !(try await FirestoreDAO.shared.isUserSignIn(userID: uid)) {
                        let user = User(id: uid, email: nil, partnerID: nil)
                        try await FirestoreDAO.shared.createUser(user: user)
                        FirestoreDAO.shared.user = user
                    }
                }
            } else {
                print(error?.localizedDescription)
            }
        }
    }
}
