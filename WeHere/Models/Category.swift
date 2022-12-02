//
//  Category.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import SwiftUI

struct Category: Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let icon: String
    let color: Color
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.id == rhs.id
    }
}
