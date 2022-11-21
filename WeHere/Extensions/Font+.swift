//
//  Font+.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/30.
//

import SwiftUI

extension Font {
    static let theme = FontTheme()
}

struct FontTheme {
    fileprivate init () { }
    
    let largeTitle = Font.system(size: 34, weight: .bold)
    let title1 = Font.system(size: 24, weight: .semibold)
    let title2 = Font.system(size: 22, weight: .semibold)
    let headline = Font.system(size: 17, weight: .bold)
    let body1 = Font.system(size: 17, weight: .regular)
    let body2 = Font.system(size: 15, weight: .regular)
    let callout = Font.system(size: 16, weight: .semibold)
    let subhead = Font.system(size: 15, weight: .semibold)
    let footnote = Font.system(size: 13, weight: .regular)
}
