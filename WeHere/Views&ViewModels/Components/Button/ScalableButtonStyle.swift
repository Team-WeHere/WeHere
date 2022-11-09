//
//  ScalableButtonStyle.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/09.
//

import SwiftUI

struct ScalableButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .background(.clear)
    }
}
