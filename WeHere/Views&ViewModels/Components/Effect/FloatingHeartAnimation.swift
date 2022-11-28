//
//  FloatingHeartAnimation.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/21.
//  ref: https://betterprogramming.pub/floating-hearts-animation-in-swiftui-1bf2f0404b12

import SwiftUI

struct FloatingHeartAnimation: GeometryEffect {
    var time: Double
    var speed = Double.random(in: 100...500)
    var xDirection = Double.random(in: -0.3...0.3)
    var yDirection = Double.random(in: -0.75...0)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * xDirection
        let yTranslation = speed * sin(yDirection) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}

struct PokeTapModifier: ViewModifier {
    @State var time = 0.0
    let duration = 2.5
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .foregroundColor(.red)
                .modifier(FloatingHeartAnimation(time: time))
                .opacity(time == 2.5 ? 0 : 1)
        }
        .onAppear {
            withAnimation(.easeOut(duration: duration)) {
                self.time = duration
            }
        }
    }
}
