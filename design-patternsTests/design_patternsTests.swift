//
//  design_patternsTests.swift
//  design-patternsTests
//
//  Created by Kenny Lin on 2017/12/1.
//  Copyright © 2017年 Kenny Lin. All rights reserved.
//

import XCTest
@testable import design_patterns

class design_patternsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testVideoAdapter() {
        let newsService: NewsService = VideoNews()
        newsService.loadNewsData()
        let data = newsService.parseNewsData()
        XCTAssert(data.title == "This is video news")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
