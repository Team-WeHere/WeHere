//
//  PinShape.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import SwiftUI

struct PinShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width: CGFloat = rect.width
        let height: CGFloat = rect.height
        
        path.move(to: CGPoint(x: 0.5*width, y: 0*height) )
        
        path.addCurve(to: CGPoint(x: 0.9167*width, y: 0.417*height),
                      control1: CGPoint(x: 0.7301*width, y: 0*height),
                      control2: CGPoint(x: 0.9167*width, y: 0.1867*height))
        
        path.addCurve(to: CGPoint(x: 0.5462*width, y: 0.981*height),
                      control1: CGPoint(x: 0.9167*width, y: 0.5996*height),
                      control2: CGPoint(x: 0.6547*width, y: 0.8748*height))
        
        path.addCurve(to: CGPoint(x: 0.4538*width, y: 0.981*height),
                      control1: CGPoint(x: 0.5202*width, y: 1.0063*height),
                      control2: CGPoint(x: 0.4798*width, y: 1.0063*height))
        
        path.addCurve(to: CGPoint(x: 0.0833*width, y: 0.417*height),
                      control1: CGPoint(x: 0.3453*width, y: 0.8748*height),
                      control2: CGPoint(x: 0.0833*width, y: 0.5996*height))
        
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0*height),
                      control1: CGPoint(x: 0.0833*width, y: 0.1867*height),
                      control2: CGPoint(x: 0.2699*width, y: 0*height))
        
        return path
    }
}
