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
    @State var isSearch = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                
                VStack(alignment: .trailing, spacing: 18) {
                    SearchView(isSearch: $isSearch, searchKeyword: $searcrhKeyword, searchResults: $searchResults)
                        .padding(.top, 22)
                    
                    if isSearch {
                        Group {
                            ScrollView(showsIndicators: false) {
                                ForEach(0..<searchResults.count, id: \.self) { index in
                                    SearchResultCell(item: $searchResults[index])
                                        .padding(.top, index == 0 ? 0 : -8)
                                }
                            }
                        }
                        .cornerRadius(20)
                        .padding(.top, 22)
                    } else {
                        locationButton
                        
                        profileButton
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
        .toolbar(.hidden)
    }
}

private extension MainView {
    var locationButton: some View {
        Button(action: {
           print("Location")
        }, label: {
            Image(systemName: "location.fill")
                .foregroundColor(.black)
                .frame(width: 44, height: 44)
                .background(.white)
                .clipShape(Circle())
        })
    }
    
    var profileButton: some View {
        NavigationLink(destination: { ProfileView() },
                       label: {
            Image(systemName: "person.fill")
               .foregroundColor(.black)
               .frame(width: 44, height: 44)
               .background(.white)
               .clipShape(Circle())
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

