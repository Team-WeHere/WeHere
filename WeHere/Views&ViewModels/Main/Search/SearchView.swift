//
//  SearchView.swift
//  WeHere
//
//  Created by Inho Choi on 2022/10/30.
//

import SwiftUI
import MapKit

struct SearchView: View {
    @State var isSearch = false
    @Binding var searchKeyword: String
    @Binding var searchResults: [MKMapItem]
    var body: some View {
        ZStack {
            customTextField
            
            HStack {
                Spacer()
                magnifyingGlassButton
            }
        }
            .frame(height: 44)
    }
}

// MARK: View에 하나의 객체
private extension SearchView {
    var magnifyingGlassButton: some View {
        Button(action: {
                withAnimation(.spring()) {
                    isSearch.toggle()
                    searchKeyword = ""
                }
                searchResults.removeAll()
            },
               label: {
            ZStack(alignment: .center) {
                Circle()
                    .foregroundColor(.white)
                if isSearch {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                } else {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
            }
            .frame(width: 44, height: 44)
        })
    }
    
    var customTextField: some View {
        ZStack {
            HStack {
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .frame(width: isSearch ? UIScreen.main.bounds.width - 32 : .zero)
            }
            
            if isSearch {
                TextField("검색어를 입력해주세요", text: $searchKeyword)
                    .padding(.horizontal, 20)
                    .onSubmit {
                        searchAction()
                    }
                    .foregroundColor(.black)
            }
        }
    }
}

// MARK: Logic ViewModel 분리할 것
private extension SearchView {
    func searchAction() {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchKeyword

        // MARK: LocationManager 정하면 지정하기
        searchRequest.region = .init(center: CLLocationCoordinate2D(latitude: 36.0144, longitude: 129.3257),
                                     latitudinalMeters: 1000,
                                     longitudinalMeters: 1000)

        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else { return }
            
            searchResults = response.mapItems
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchKeyword: .constant(""), searchResults: .constant([]))
    }
}
