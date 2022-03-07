//
//  Search.swift
//  MyFood
//
//  Created by Hugo Tiem on 05/03/2022.
//

import Foundation

public class Search {
    
    private static var _instance: Search? = nil
    
    static func getInstance() -> Search! {
        if(_instance == nil) {
            _instance = Search()
        }
        return _instance
    }
    
    func autoComplete(search: String, completion: @escaping (([String]?, Error?) -> Void)) -> Void {
        
//        var hasCoordinate: Bool = true
//
//        if lat == nil || lng == nil {
//            hasCoordinate = false
//        }

        
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/queryautocomplete/json?input=\(search)&key=AIzaSyABOSYWAyHuVESY0H-Tt_JGlkx_suQ6rvI")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary else {
                    return
                }
                
                guard let toData = json["predictions"] as? NSArray else {
                    return
                }
                
                var results: [String] = []
                
                for res in toData {
                    guard let r = res as? NSDictionary, let desc = r["description"] as? String else {
                        return
                    }
                    print(r)
                    results.append(desc)
                }
                
                print(results)
                
                completion(results, nil)
            } catch let err {
                completion(nil, err)
            }
        }
        dataTask.resume()
        
        
    }
 
    func fetchRestaurant(search: String, completion: @escaping (([Restaurant]?, Error?) -> Void)) {
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(search)&type=restaurant&key=AIzaSyABOSYWAyHuVESY0H-Tt_JGlkx_suQ6rvI")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary else {
                    return
                }
                
                guard let toData = json["results"] as? NSArray else {
                    return
                }
                
                var restaurants: [Restaurant] = []
                
                for restaurant in toData {
                    let rest: Restaurant = Restaurant.fromJson(json: restaurant as? NSDictionary)
                    restaurants.append(rest)
                }
                completion(restaurants, nil)
            } catch let err {
                completion(nil, err)
            }
        }
        dataTask.resume()

    }
    
    
}
