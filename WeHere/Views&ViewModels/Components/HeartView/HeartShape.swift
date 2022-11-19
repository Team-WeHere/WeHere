//
//  HeartShape.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import SwiftUI

struct HeartShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width: CGFloat = rect.width
        let height: CGFloat = rect.height
        
        path.move(to: CGPoint(x: 0*width, y: 0.3654*height))
        
        path.addCurve(to: CGPoint(x: 0.2805*width, y: 0.0543*height),
                      control1: CGPoint(x: 0*width, y: 0.1831*height),
                      control2: CGPoint(x: 0.1224*width, y: 0.0543*height))
        
        path.addCurve(to: CGPoint(x: 0.4628*width, y: 0.14*height),
                      control1: CGPoint(x: 0.3553*width, y: 0.0543*height),
                      control2: CGPoint(x: 0.4176*width, y: 0.087*height))
        
        path.addCurve(to: CGPoint(x: 0.5374*width, y: 0.14*height),
                      control1: CGPoint(x: 0.4813*width, y: 0.1616*height),
                      control2: CGPoint(x: 0.5188*width, y: 0.1616*height))
        
        path.addCurve(to: CGPoint(x: 0.7195*width, y: 0.0543*height),
                      control1: CGPoint(x: 0.5828*width, y: 0.0868*height),
                      control2: CGPoint(x: 0.6446*width, y: 0.0543*height))
        
        path.addCurve(to: CGPoint(x: 1*width, y: 0.3654*height),
                      control1: CGPoint(x: 0.8776*width, y: 0.0543*height),
                      control2: CGPoint(x: 1.0*width, y: 0.1831*height))
        
        path.addCurve(to: CGPoint(x: 0.5368*width, y: 0.9861*height),
                      control1: CGPoint(x: 1*width, y: 0.5849*height),
                      control2: CGPoint(x: 0.8202*width, y: 0.8007*height))
        
        path.addCurve(to: CGPoint(x: 0.5*width, y: 1*height),
                      control1: CGPoint(x: 0.5106*width, y: 1.0*height),
                      control2: CGPoint(x: 0.5257*width, y: 0.9928*height))
        
        path.addCurve(to: CGPoint(x: 0.4637*width, y: 0.9861*height),
                      control1: CGPoint(x: 0.4743*width, y: 0.9928*height),
                      control2: CGPoint(x: 0.5106*width, y: 1.0*height))
        
        path.addCurve(to: CGPoint(x: 0*width, y: 0.3654*height),
                      control1: CGPoint(x: 0.1798*width, y: 0.8007*height),
                      control2: CGPoint(x: 0*width, y: 0.5849*height))
        
        return path
    }
}
