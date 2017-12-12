//
//  DiscountService.swift
//  design-patterns
//
//  Created by Kenny Lin on 2017/12/12.
//  Copyright © 2017年 Kenny Lin. All rights reserved.
//

import Foundation

struct ProductData {
    var name: String
    var number: Int
    var price: Int
}

class DiscountService {
    
    init(discountStrategy: DiscountStrategy, productData: ProductData) {
        
    }
    
    func calculateTotalPrice() -> Int {
        return 0
    }
}

protocol DiscountStrategy {
    func getDiscountPrice() -> Int
}

class GeneralDiscount: DiscountStrategy {
    
    func getDiscountPrice() -> Int {
        return 0
    }
}

class BuyTenGetOneFreeDiscount: DiscountStrategy {
    
    func getDiscountPrice() -> Int {
        return 0
    }
}

class TenPercentDiscount: DiscountStrategy {
    
    func getDiscountPrice() -> Int {
        return 0
    }
}
