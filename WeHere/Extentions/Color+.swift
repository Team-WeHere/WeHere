//
//  Color+.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double((rgb >> 0) & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
    
    static let pink01 = Color(hex: "#F9CFD0")
    static let pink02 = Color(hex: "#F99592")
    static let yellow01 = Color(hex: "#FFECC8")
    static let yellow02 = Color(hex: "#FFD179")
    static let grren01 = Color(hex: "#EAF3C3")
    static let green02 = Color(hex: "#B8CC5C")
    static let blue01 = Color(hex: "#CFDBF6")
    static let blue02 = Color(hex: "#7A8AB8")
    static let purple01 = Color(hex: "#D9D7F1")
    static let purple02 = Color(hex: "#9089BE")
    
    static let gray01 = Color(hex: "#434A54")
    static let gray02 = Color(hex: "#656D78")
    static let gray03 = Color(hex: "#AAB2BD")
    static let gray04 = Color(hex: "#CCD0D9")
    static let gray05 = Color(hex: "#E6E9EE")
    
    // Heart Profile
    static let gradient1 = Color(hex: "#F9CFD0")
    static let gradient2 = Color(hex: "#FFEFD1")
    static let gradient3 = Color(hex: "#DACFDF")
    static let gradient4 = Color(hex: "#D2D9E9")
    static let gradient5 = Color(hex: "#E6E4F1")
}
