//
//  WeHereApp.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/15.
//

import SwiftUI

@main
struct WeHereApp: App {
    @StateObject private var viewModel = MapViewModel()
    
    var body: some Scene {
        WindowGroup {
            MapView()
                .environmentObject(viewModel)
        }
    }
}
