//
//  MapView.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject private var viewModel: MapViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion,
                showsUserLocation: true, annotationItems: viewModel.places,
                annotationContent: { location in
                MapMarker(coordinate: location.coordinates, tint: .blue)
//                MapAnnotation(coordinate: location.coordinates) {
//                    LocationMapAnnotationView()
//                        .scaleEffect(viewModel.selectedPlace == location ? 1 : 0.7)
//                        .shadow(radius: 10)
//                        .onTapGesture {
//                            viewModel.showNextLocation(place: location)
//                        }
//                }
            })
            .ignoresSafeArea()
            .accentColor(Color(.systemMint))
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(MapViewModel())
    }
}
