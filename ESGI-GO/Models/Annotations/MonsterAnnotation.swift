//
//  MonsterAnnotation.swift
//  ESGI-GO
//
//  Created by Benoit Briatte on 13/01/2022.
//

import UIKit
import MapKit

class MonsterAnnotation: Monster, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    var title: String? {
        return self.name
    }
    
    override init(name: String, level: Int, damage: Int, hp: Int, xp: Int) {
        self.coordinate = .init(latitude: 0, longitude: 0)
        super.init(name: name, level: level, damage: damage, hp: hp, xp: xp)
    }
}
