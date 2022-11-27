//
//  WeHereApp.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/15.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import FirebaseCore

@main
struct WeHereApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: "네이티브 앱 키")
    }
    var body: some Scene {
        WindowGroup {
//            MainView()
            LoginView()
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
