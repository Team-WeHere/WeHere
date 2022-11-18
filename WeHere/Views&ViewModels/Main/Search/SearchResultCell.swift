//
//  SearchResultCell.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/30.
//

import SwiftUI
import MapKit

struct SearchResultCell: View {
    @Binding var item: MKMapItem
    var address: String {
        guard let sido = item.placemark.administrativeArea,
              let gugun = item.placemark.locality,
              let dong = item.placemark.subLocality,
              let road = item.placemark.thoroughfare,
              let subRoad = item.placemark.subThoroughfare
        else { return "연인과 함께하고 싶은 다른 장소를 검색해보세요!"}
        
        return sido + " " + gugun + " " + dong + " " + road + " " + subRoad
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle().foregroundColor(.white)
            
            VStack(alignment: .leading) {
                Text(item.placemark.name ?? "아쉽게도 일치하는 장소가 없어요")
                    .foregroundColor(.black)
                    .font(.theme.subhead)
                
                Text(address)
                    .foregroundColor(.black)
                    .font(.theme.footnote)
            }
            .padding(.horizontal, 18)
        }
        .frame(height: 88)
    }
}
