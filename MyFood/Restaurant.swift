//
//  Restaurant.swift
//  MyFood
//
//  Created by Hugo Tiem on 05/03/2022.
//

import Foundation

public class Restaurant {
    private var name: String?
    private var coordinates: [Double?]?
    private var address: String?
    private var tag: String?
    
    public func getName() -> String?  {
        return self.name
    }
    
    public func getCoordinates() -> [Double?]? {
        return self.coordinates
    }
    
    public func getAddress() -> String? {
        return self.address
    }
    
    public func getTag() -> String? {
        return self.tag
    }
    
    public init(name: String?, coordinates:[Double]?, address: String?, tag: String?) {
        self.name = name
        self.coordinates = coordinates
        self.address = address
        self.tag = tag
    }
    
    static func fromJson(json: NSDictionary?) -> Restaurant {
        
        let address = json?["formatted_address"] as? String
        let name = json?["name"] as? String
        
        let location = (json?["geometry"] as? NSDictionary)?["location"] as? NSDictionary
        let lat: Double? = location?["lat"] as? Double
        let lng: Double? = location?["lng"] as? Double
        let coordinates = [lat ?? 0, lng ?? 0]
        
        return Restaurant(name: name, coordinates: coordinates, address: address, tag: nil)
    }
}
