//
//  MonsterInfo.swift
//  ESGI-GO
//
//  Created by Benoit Briatte on 13/01/2022.
//

import Foundation

class MonsterInfo {
    var name: String
    var damage: Int
    var hp: Int
    var xp: Int
    
    init(name: String, damage: Int, hp: Int, xp: Int) {
        self.name = name
        self.damage = damage
        self.hp = hp
        self.xp = xp
    }
}
