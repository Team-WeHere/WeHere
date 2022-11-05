//
//  MapViewModel.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/05.
//

import MapKit
import Foundation

enum MapSetup {
    static let defaultLocation = CLLocationCoordinate2D(latitude: 36.0197223,
                                                         longitude: 129.3250806)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05,
                                              longitudeDelta: 0.05)
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var mapRegion = MKCoordinateRegion(center: MapSetup.defaultLocation, span: MapSetup.defaultSpan)
    
    var locationManager: CLLocationManager?
    
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
