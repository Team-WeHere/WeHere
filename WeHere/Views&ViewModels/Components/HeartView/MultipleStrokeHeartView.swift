//
//  MultipleStrokeHeartView.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/21.
//

import SwiftUI

struct MultipleStrokeHeartView: View {
    var width: CGFloat = 100
    var height: CGFloat = 100
    var isPoked = false
    var image = "sample-profile"
    
    var body: some View {
        ZStack {
            Image(image, label: Text("ControlButton"))
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(HeartShape())
                .overlay(
                    HStack {
                        if isPoked {
                            HeartShape()
                                .stroke(Color.pink01.opacity(0.5),
                                        lineWidth: 12)
                        } else {
                            HeartShape()
                                .stroke(Color.gray05,
                                        lineWidth: 12)
                        }
                    }
                )
            
            Image(image, label: Text("ControlButton"))
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(HeartShape())
                .overlay(
                    HStack {
                        if isPoked {
                            HeartShape()
                                .stroke(Color.pink01,
                                        lineWidth: 4)
                        } else {
                            HeartShape()
                                .stroke(Color.gray04,
                                        lineWidth: 4)
                        }
                    }
                )
        }
    }
}

struct MultipleStrokeHeartView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleStrokeHeartView()
    }
}
