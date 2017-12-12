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
    
    func testGeneralDiscount() {
        let productData: ProductData = ProductData(name: "", number: 1, price: 20)
        let discountService: DiscountService = DiscountService(discountStrategy: GeneralDiscount(), productData: productData)
        XCTAssert(discountService.calculateTotalPrice() == 18)
    }
    
    func testBuyTenGetOneFreeDiscount() {
        let productData: ProductData = ProductData(name: "", number: 1, price: 20)
        let discountService: DiscountService = DiscountService(discountStrategy: BuyTenGetOneFreeDiscount(), productData: productData)
        XCTAssert(discountService.calculateTotalPrice() == 20)
        
        let productData2: ProductData = ProductData(name: "", number: 10, price: 20)
        let discountService2: DiscountService = DiscountService(discountStrategy: BuyTenGetOneFreeDiscount(), productData: productData2)
        XCTAssert(discountService2.calculateTotalPrice() == 180)
    }
    
    func testTenPercentDiscount() {
        let productData: ProductData = ProductData(name: "", number: 5, price: 20)
        let discountService: DiscountService = DiscountService(discountStrategy: TenPercentDiscount(), productData: productData)
        XCTAssert(discountService.calculateTotalPrice() == 90)
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
