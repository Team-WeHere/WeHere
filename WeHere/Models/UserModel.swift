//
//  UserModel.swift
//  WeHere
//
//  Created by Inho Choi on 2022/11/28.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String?
    let partnerID: String?
}
