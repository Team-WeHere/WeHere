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
            Color.orange
            
            PokeModal()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
