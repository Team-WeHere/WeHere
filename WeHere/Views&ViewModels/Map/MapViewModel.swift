//
//  MapViewModel.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import MapKit
import SwiftUI

enum MapSetup {
    static let defaultLocation = CLLocationCoordinate2D(latitude: 36.0197223,
                                                         longitude: 129.3250806)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.02,
                                              longitudeDelta: 0.02)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var places: [Place]
    @Published var selectedPlace: Place?
    @Published var mapRegion = MKCoordinateRegion(center: MapSetup.defaultLocation, span: MapSetup.defaultSpan)
    
    var locationManager: CLLocationManager?

    override init() {
        let places = Place.mockData
        self.places = places
    }
    
    func updateSelectedPlace(place: Place) {
        withAnimation(.easeInOut) {
            selectedPlace = place
            mapRegion = MKCoordinateRegion(center: place.coordinates,
                                           span: MapSetup.defaultSpan)
        }
    }
    
    func checkIfLocationServicesIsEnabled() {
        self.locationManager = CLLocationManager()
        self.locationManager!.delegate = self
 
        /*
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager = CLLocationManager()
            self.locationManager!.delegate = self
        } else {
            print("허용이 안되었을때")
        }
        */
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            print("Go to settings")
            
        case .denied:
            print("Go to settings")
            
        case .authorizedAlways, .authorizedWhenInUse:
            mapRegion = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MapSetup.defaultSpan)
            
        @unknown default:
            break
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
