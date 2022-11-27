//
//  BottomModal.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/21.
//

import SwiftUI

struct BottomModal: View {
    @State private var currentIndex = 0
    let place = Place.mockData[1]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<1) { index in
                ZStack {
                    Color.white
                    switch index {
                    case 0:
                        pokeView
                            .padding(28)
                        
                    case 1:
                        placeDetailView
                            .padding(28)
                        
                    default:
                        EmptyView()
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 30.0,
                                            style: .continuous))
            }
            .padding(10)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.88)
//        .overlay(
//            VStack {
//                Spacer()
//                IndexView(currentIndex: currentIndex)
//                    .padding(.bottom, 28)
//            }
//        )
    }
}

extension BottomModal {
    private var pokeView: some View {
        ZStack {
            VStack {
                HStack {
                    Text(place.name)
                        .font(Font.theme.title1)
                        .foregroundColor(Color.black)
                    Spacer()
                }

                HStack {
                    Image(place.category.name)
                        .resizable()
                        .frame(width: 20, height: 24)
                    Text(place.address)
                        .font(Font.theme.body2)
                        .foregroundColor(Color.gray02)
                    Spacer()
                }
                
                Button {
                    HapticManager.shared.notification(type: .success)
                } label: {
                    MultipleStrokeHeartView(width: 112, height: 105, isPoked: place.isPoked, image: "profile-girl")
                }
                .padding(.bottom, 25)
                
                Text(place.isPoked
                     ? "푸린님이 콕 한 장소에요!"
                     : "폼폼님께 이 장소를 콕 하세요!")
                    .font(Font.theme.body2)
                    .foregroundColor(Color.gray02)
            }
        }
    }
    private var placeDetailView: some View {
        VStack {
            HStack {
                Text(place.name)
                    .font(Font.theme.title1)
                    .foregroundColor(Color.black)
                Spacer()
            }
            HStack {
                Image(place.category.name)
                    .resizable()
                    .frame(width: 20, height: 24)
                Text(place.address)
                    .font(Font.theme.body2)
                    .foregroundColor(Color.gray02)
                Spacer()
            }
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
    }
}

/*
struct BottomModal_Previews: PreviewProvider {
    static var previews: some View {
        BottomModal()
    }
}
*/
