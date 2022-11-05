//
//  HapticManager.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/06.
//
// ref: https://seons-dev.tistory.com/entry/SwiftUI-Haptic-Feedback-haptics-vibrations

import UIKit

class HapticManager {
    
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
