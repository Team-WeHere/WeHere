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
        else { return "표시할 수 없습니다."}
        
        return sido + " " + gugun + " " + dong + " " + road + " " + subRoad
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle().foregroundColor(.white)
            
            VStack(alignment: .leading) {
                Text(item.placemark.name ?? "표시할 수 없습니다.")
                    .foregroundColor(.black)
                
                Text(address)
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 18)
        }
        .frame(height: 88)
    }
}
