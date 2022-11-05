//
//  HeartView.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import SwiftUI

struct HeartView: View {
    private let gradient = LinearGradient(gradient: Gradient(stops: [
        Gradient.Stop(color: Color.gradient1, location: 0.15),
        Gradient.Stop(color: Color.gradient2, location: 0.3),
        Gradient.Stop(color: Color.gradient3, location: 0.45),
        Gradient.Stop(color: Color.gradient4, location: 0.6),
        Gradient.Stop(color: Color.gradient5, location: 0.75)
    ]), startPoint: .topTrailing, endPoint: .bottomLeading)
    
    var hasStroke = true
    
    var body: some View {
        ZStack {
            Image("sample-profile", label: Text("ControlButton"))
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(heartPath(width: 100, height: 100))
                .overlay(
                    heartPath(width: 100, height: 100)
                        .stroke(gradient, lineWidth: hasStroke ? 5 : 0)
                )
        }
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView()
    }
}
