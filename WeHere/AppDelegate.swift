//
//  AppDelegate.swift
//  WeHere
//
//  Created by Inho Choi on 2022/11/28.
//

import FirebaseCore
import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
