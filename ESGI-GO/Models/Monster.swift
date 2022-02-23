//
//  Monster.swift
//  ESGI-GO
//
//  Created by Benoit Briatte on 13/01/2022.
//

import Foundation

class Monster: NSObject, Fighter {
    var name: String
    var level: Int
    var damage: Int
    var hp: Int
    var xp: Int
    
    init(name: String, level: Int, damage: Int, hp: Int, xp: Int) {
        self.name = name
        self.level = level
        self.damage = damage
        self.hp = hp
        self.xp = xp
    }
}
