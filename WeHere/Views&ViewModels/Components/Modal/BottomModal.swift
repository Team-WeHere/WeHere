//
//  BottomModal.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/21.
//

import SwiftUI

struct BottomModal: View {
    @State private var currentIndex = 0
    private let colors: [Color] = [.red, .blue, .green, .yellow]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<2) { index in
                ZStack {
                    Color.white
                    switch index {
                    case 0:
                        pokeView
                        
                    case 1:
                        placeDetailView
                        
                    default:
                        EmptyView()
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 30.0,
                                            style: .continuous))
            }
            .padding(.all, 10)
        }
        .tabViewStyle(.page)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.88)
    }
}

extension BottomModal {
    private var pokeView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("담박집")
                    .font(Font.theme.title1)
                Spacer()
            }
            HStack {
                Image("cafe")
                    .resizable()
                    .frame(width: 20, height: 24)
                Text("경상북도 포항시 지곡로80")
                    .font(Font.theme.body2)
                    .foregroundColor(Color.gray02)
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Button {
                        HapticManager.shared.notification(type: .success)
                    } label: {
                        HeartView(width: 112, height: 105, hasStroke: false)
                    }
                    .padding(.bottom, 25)
                    Text("폼폼님께 이 장소를 콕 하세요!")
                        .font(Font.theme.body2)
                        .foregroundColor(Color.gray02)
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 28, leading: 28, bottom: 0, trailing: 28))
    }
    private var placeDetailView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("담박집")
                    .font(Font.theme.title1)
                Spacer()
            }
            HStack {
                Image("cafe")
                    .resizable()
                    .frame(width: 20, height: 24)
                Text("경상북도 포항시 지곡로80")
                    .font(Font.theme.body2)
                    .foregroundColor(Color.gray02)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image("notyet")
                        .resizable()
                        .frame(width: 45, height: 54)
                        .padding(.bottom, 11)
                    Text("준비중입니다!")
                        .font(Font.theme.body2)
                        .foregroundColor(Color.gray02)
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 28, leading: 28, bottom: 0, trailing: 28))
    }
}

struct BottomModal_Previews: PreviewProvider {
    static var previews: some View {
        BottomModal()
    }
}
