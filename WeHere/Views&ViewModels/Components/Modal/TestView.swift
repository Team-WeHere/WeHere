//
//  TestView.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/21.
//

import SwiftUI

struct TestView: View {
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

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
