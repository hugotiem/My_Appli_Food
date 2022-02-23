//
//  XPFactory.swift
//  ESGI-GO
//
//  Created by Benoit Briatte on 13/01/2022.
//

import Foundation

class XPFactory {
    
    class func XPFor(level: Int) -> XP {
        return XP(next: (level * level) * 100)
    }

}
