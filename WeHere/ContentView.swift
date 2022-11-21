//
//  ContentView.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/15.
//

import SwiftUI

struct ContentView: View {
    @State var isPokeModalShown = false
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isPokeModalShown.toggle()
                    } label: {
                        Text("모달을 띄워보세요")
                    }
                    Spacer()
                }
                Spacer()
            }
            .background(isPokeModalShown ?
                        Color.black.opacity(0.5)
                        : Color.clear)
 
            if isPokeModalShown {
                PokeModal(isShown: $isPokeModalShown)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
