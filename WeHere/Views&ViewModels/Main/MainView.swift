//
//  MainView.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/21.
//

import SwiftUI
import MapKit

struct MainView: View {
    @State var searcrhKeyword = ""
    @State var searchResults = [MKMapItem]()
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            VStack {
                SearchView(searchKeyword: $searcrhKeyword, searchResults: $searchResults)
                    .padding(.top, 22)
                    .padding(.horizontal, 16)
                
                ScrollView(showsIndicators: false) {
                    ForEach(0..<searchResults.count, id: \.self) { index in
                        SearchResultCell(item: $searchResults[index])
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.top, 22)
                
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
