//
//  MapConfiguration.swift
//  Map configuration and location access
//
//  Created by Thiago Duarte on 7/17/25.
//

import SwiftUI
import MapboxMaps
import CoreLocation
import Foundation
import Combine

struct MapConfiguration {
    // Map viewport settings
    static let defaultZoom: Double = 14
    static let defaultPitch: Double = 0
    
    // Map style configuration
    static let customStyleURI = "mapbox://styles/doordash/cm5x2b2jz00cj01slckm8h5w0"
    
    // Create default viewport
    static var defaultViewport: Viewport {
        .followPuck(zoom: defaultZoom, pitch: defaultPitch)
    }
    
    // Create configured map view
    static func createMapView() -> some View {
        Map(initialViewport: defaultViewport) {
            Puck2D()
                .showsAccuracyRing(true)
        }
        .mapStyle(.customStyle)
        .ignoresSafeArea()
    }
}

// Custom map style extension
extension MapStyle {
    static let customStyle = MapStyle(uri: StyleURI(rawValue: MapConfiguration.customStyleURI)!)
}

// MARK: - Location Permission Manager
class LocationPermissionManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        manager.delegate = self
        authorizationStatus = manager.authorizationStatus
    }
    
    func requestLocationPermission() {
        switch authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            print("Location access denied or restricted")
        case .authorizedWhenInUse, .authorizedAlways:
            print("Location permission already granted")
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatus = status
        print("Location authorization status changed to: \(status)")
    }
}
