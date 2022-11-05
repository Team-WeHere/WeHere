//
//  Place.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import Foundation
import MapKit

struct Place: Identifiable, Equatable {
    let id = UUID().uuidString
    let name: String
    let category: Category
    let address: String
    let latitude: Double
    let longitude: Double
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }
}
