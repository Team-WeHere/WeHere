//
//  ContentView.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/15.
//

import SwiftUI

struct ContentView: View {
    @State var likes = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
  
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            VStack {
                Spacer()
                BottomModal(likes: $likes)
            }
            VStack {
                Spacer()
                ForEach(0..<likes, id: \.self) { _ in
                    HeartView(width: 42, height: 42,
                              hasStroke: false, image: "profile-girl")
                    .modifier(LikeTapModifier())
                    .padding()
                    .onReceive(timer) { _ in
                        likes -= 1
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
