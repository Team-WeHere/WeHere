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
        guard let administration = item.placemark.administrativeArea,
              let city = item.placemark.locality,
              let subCity = item.placemark.subLocality,
              let street = item.placemark.thoroughfare,
              let subStreet = item.placemark.subThoroughfare
        else { return "표시할 수 없습니다."}
        
        return administration + " " + city + " " + subCity + " " + street + " " + subStreet
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

//struct SearchResultCell_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultCell(item: .init())
//    }
//}
