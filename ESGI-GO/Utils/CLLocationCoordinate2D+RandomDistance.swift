//
//  CLLocationCoordinate2D+RandomDistance.swift
//  ESGI-GO
//
//  Created by Benoit Briatte on 13/01/2022.
//

import CoreLocation

extension CLLocationCoordinate2D {
    
    func randomCoordinate(range: ClosedRange<Double>) -> CLLocationCoordinate2D {
        let radiusEarth = Double(6378137)
        let initLat = self.latitude
        let initLon = self.longitude
        let latRand = Double.random(in: range)
        let lonRand = Double.random(in: range)
        let dLat = latRand / radiusEarth
        let dLon = lonRand / (radiusEarth * cos(.pi * initLat / 180.0))
        let resLat = initLat + dLat * 180 / Double.pi
        let resLon = initLon + dLon * 180 / Double.pi
        return CLLocationCoordinate2DMake(CLLocationDegrees(resLat), CLLocationDegrees(resLon))
    }
    
}
