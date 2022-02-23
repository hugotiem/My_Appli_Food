//
//  XP.swift
//  ESGI-GO
//
//  Created by Benoit Briatte on 13/01/2022.
//

import Foundation

class XP {
    var current: Int
    var next: Int
    
    convenience init(next: Int) {
        self.init(current: 0, next: next)
    }
    
    fileprivate init(current: Int, next: Int) {
        self.current = current
        self.next = next
    }
}
