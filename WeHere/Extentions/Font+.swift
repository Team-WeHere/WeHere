//
//  Font+.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/30.
//

import SwiftUI

private let sfpro = "SF-Pro"

extension Font {
    static let theme = Theme()
}

struct Theme {
    fileprivate init () { }
    
    let largeTitle = Font.custom(sfpro, size: 34).weight(.bold)
    let title1 = Font.custom(sfpro, size: 28).weight(.semibold)
    let title2 = Font.custom(sfpro, size: 20).weight(.semibold)
    let headline = Font.custom(sfpro, size: 17).weight(.bold)
    let body1 = Font.custom(sfpro, size: 17).weight(.regular)
    let body2 = Font.custom(sfpro, size: 15).weight(.regular)
    let callout = Font.custom(sfpro, size: 16).weight(.semibold)
    let subhead = Font.custom(sfpro, size: 15).weight(.medium)
    let footnote = Font.custom(sfpro, size: 13).weight(.regular)
}
