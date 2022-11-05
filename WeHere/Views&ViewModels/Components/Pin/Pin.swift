//
//  Pin.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import SwiftUI

struct Pin: View {
    var category: Category
    
    var body: some View {
        ZStack {
            // IMAGE PIN
            Image(category.name, label: Text(category.name))
                .resizable()
                .scaledToFill()
            
            /* CUSTOM PIN
            PinShape()
                .frame(width: 45, height: 45)
                .foregroundColor(category.color)

            Circle()
                .frame(width: 22, height: 22)
                .foregroundColor(.white)
                .offset(x: 0, y: -4)

            Image(systemName: category.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .padding()
                .foregroundColor(.gray02)
                .offset(x: 0, y: -4)
            */
        }
        .padding(.bottom, 40)
    }
}

struct Pin_Previews: PreviewProvider {
    static var previews: some View {
        Pin(category: Category.mockData[0])
    }
}
