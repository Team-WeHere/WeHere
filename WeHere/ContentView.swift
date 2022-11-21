//
//  ContentView.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            VStack {
                Spacer()
                BottomModal()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
