//
//  MyFoodTests.swift
//  MyFoodTests
//
//  Created by Hugo Tiem on 05/03/2022.
//

import XCTest
@testable import MyFood

class MyFoodTests: XCTestCase {
    
    var restaurants: [Restaurant]?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearch() throws {
        let search: Search = Search()
        let expectation = self.expectation(description: "Searching")
        search.fetchRestaurant(search: "mcdo") { data, err in
            
            print(data)
            XCTAssertNotNil(data)
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
