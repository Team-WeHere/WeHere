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

class SNSLoginManager {
    private init() { }
    
    static let shared = SNSLoginManager()
    
    func signInWithKakao() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
            }
        }
    }
    
    
}
