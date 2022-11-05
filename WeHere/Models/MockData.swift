//
//  MockData.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import Foundation

extension Category {
    static let mockData: [Category] = [
        Category(name: "cafe", icon: "", color: ""),
        Category(name: "drink", icon: "", color: ""),
        Category(name: "food", icon: "", color: ""),
        Category(name: "culture", icon: "", color: ""),
        Category(name: "etc", icon: "", color: ""),
        Category(name: "default", icon: "", color: "")
    ]
    
    static let empty: [Category] = []
}

extension Place {
    static let mockData: [Place] = [
        Place(name: "담박집",
              category: Category.mockData[3],
              address: "경북 포항시 남구 효자동 223-2",
              latitude: 36.009244880301694,
              longitude: 129.333276892455),
        Place(name: "담박집",
              category: Category.mockData[3],
              address: "경북 포항시 남구 효자동 223-3",
              latitude: 36.00917954974529,
              longitude: 129.33311527944772),
        Place(name: "복숭A",
              category: Category.mockData[3],
              address: "경북 포항시 남구 효자동 305-5",
              latitude: 36.00871768988776,
              longitude: 129.3315225469234)
    ]

    static let empty: [Place] = []
}
