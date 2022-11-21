//
//  ContentView.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/15.
//

import SwiftUI

struct ContentView: View {
    @State var hearts = 0
    @State var isFloatingAnimieActivated = false
    private let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    
    func floatHeartAction() {
        hearts += 7
        isFloatingAnimieActivated = true
    }
  
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Button {
                    floatHeartAction() //
                } label: {
                    Text("애니메이션!")
                        .foregroundColor(Color.white)
                }
                .disabled(isFloatingAnimieActivated)
                Spacer()
                BottomModal()
            }
            
            // MARK: Floating Heart Animation View
            VStack {
                Spacer()
                ForEach(0..<hearts, id: \.self) { _ in
                    HeartView(width: 42, height: 42,
                              hasStroke: false, image: "profile-girl")
                    .modifier(PokeTapModifier())
                    .padding()
                    .onReceive(timer) { _ in
                        hearts -= 1
                        if hearts == 0 {
                            isFloatingAnimieActivated = false
                        }
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
