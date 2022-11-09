//
//  HapticManager.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/06.
//
// ref: https://seons-dev.tistory.com/entry/SwiftUI-Haptic-Feedback-haptics-vibrations

import UIKit

class HapticManager {
    static let shared = HapticManager()
    
    private init() {}
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(type)
        }
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        DispatchQueue.main.async {
            let generator = UIImpactFeedbackGenerator(style: style)
            generator.impactOccurred()
        }
    }
}
