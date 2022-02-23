//
//  MonsterService.swift
//  ESGI-GO
//
//  Created by Benoit Briatte on 13/01/2022.
//

import Foundation

class MonsterService {
    
    var montersInfo: [MonsterInfo] = []
    
    static let shared = MonsterService()
    
    private init() {
        guard let url = Bundle.main.url(forResource: "Monsters", withExtension: "plist"),
              let data = try? Data(contentsOf: url) else {
            return
        }
        let res = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil)
        print(res)
    }
    
    func randomMonster(level: Int) -> Monster? {
        return nil
    }
}
