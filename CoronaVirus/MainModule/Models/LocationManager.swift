//
//  LocationManager.swift
//  Lejka
//
//  Created by Дмитрий Токарев on 23.12.2019.
//  Copyright © 2019 Lejka. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager:NSObject, CLLocationManagerDelegate {
    private let manager: CLLocationManager
    
    var lat:Double?
    var long:Double?


    init(manager: CLLocationManager = CLLocationManager()) {
        self.manager = manager
        super.init()
    }

    func startUpdating() {
        self.manager.delegate = self
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            long = locations.last?.coordinate.longitude
            lat = locations.last?.coordinate.latitude
         }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
}
