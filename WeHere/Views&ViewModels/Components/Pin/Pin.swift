//
//  Pin.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import SwiftUI

struct Pin: View {
    var body: some View {
        ZStack {
            PinShape()
                .frame(width: 45, height: 45)
                .foregroundColor(.red)
            
            Circle()
                .frame(width: 22, height: 22)
                .foregroundColor(.white)
                .offset(x: 0, y: -4)
            
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 12, height: 12)
                .foregroundColor(.gray)
                .offset(x: 0, y: -4)
        }
        .padding(.bottom, 40)
    }
}

struct Pin_Previews: PreviewProvider {
    static var previews: some View {
        Pin()
    }
}
