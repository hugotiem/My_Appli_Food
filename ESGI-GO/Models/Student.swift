//
//  Student.swift
//  ESGI-GO
//
//  Created by Benoit Briatte on 13/01/2022.
//

import Foundation

enum Sex: Int {
    case Male = 0
    case Female = 1
}

class Student: Fighter {
    var nickname: String
    var sex: Sex
    var height: Float
    var level: Int
    var xp: XP
    var hp: Int
    var damage: Int
    
    convenience init(nickname: String, sex: Sex, height: Float) {
        self.init(nickname: nickname, sex: sex, height: height, level: 1, xp: XPFactory.XPFor(level: 1), hp: 100, damage: 5)
    }
    
    fileprivate init(nickname: String, sex: Sex, height: Float, level: Int, xp: XP, hp: Int, damage: Int) {
        self.nickname = nickname
        self.sex = sex
        self.height = height
        self.level = level
        self.xp = xp
        self.hp = hp
        self.damage = damage
    }
}
