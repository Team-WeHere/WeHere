//
//  MockData.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import SwiftUI

extension Category {
    static let mockData: [Category] = [
        Category(name: "cafe", icon: "cup.and.saucer.fill", color: Color.pink02),
        Category(name: "drink", icon: "wineglass.fill", color: Color.yellow02),
        Category(name: "food", icon: "fork.knife", color: Color.green02),
        Category(name: "culture", icon: "ticket.fill", color: Color.blue02),
        Category(name: "etc", icon: "guitars.fill", color: Color.purple02),
        Category(name: "default", icon: "heart.fill", color: Color.pink02)
    ]
    
    static let empty: [Category] = []
}

extension Place {
    static let mockData: [Place] = [
        Place(name: "담박집",
              category: Category.mockData[2],
              address: "경북 포항시 남구 효자동 223-2",
              latitude: 36.009244880301694,
              longitude: 129.333276892455,
              isPoked: true),
        Place(name: "담박집2",
              category: Category.mockData[2],
              address: "경북 포항시 남구 효자동 223-3",
              latitude: 36.00917954974529,
              longitude: 129.33311527944772,
              isPoked: false),
        Place(name: "복숭A",
              category: Category.mockData[1],
              address: "경북 포항시 남구 효자동 305-5",
              latitude: 36.00871768988776,
              longitude: 129.3315225469234,
              isPoked: true)
    ]

    static let empty: [Place] = []
}
