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
    var quantity: Int
    var price: Int
}

class DiscountService {
    
    private var discountStrategy: DiscountStrategy
    private var productData: ProductData
    
    init(discountStrategy: DiscountStrategy, productData: ProductData) {
        self.discountStrategy = discountStrategy
        self.productData = productData
    }
    
    
    public func calculateTotalPrice() -> Int {
        return self.discountStrategy.getDiscountPrice(quantity: productData.quantity, price: productData.price)
    }
    
    public func showDetail() {
        print("Product: \(self.productData.name)")
        print("Price: \(self.productData.price)")
        print("Quantity: \(self.productData.quantity)")
        print("Total: \(self.productData.price * self.productData.quantity)")
        print("Discount Price: \(self.discountStrategy.getDiscountPrice(quantity: productData.quantity, price: productData.price))")
    }
}

protocol DiscountStrategy {
    func getDiscountPrice(quantity: Int, price: Int) -> Int
}

class GeneralDiscount: DiscountStrategy {
    
    public func getDiscountPrice(quantity: Int, price: Int) -> Int {
        return quantity * price
    }
}

class BuyTenGetOneFreeDiscount: DiscountStrategy {
    
    public func getDiscountPrice(quantity: Int, price: Int) -> Int {
        return (quantity - (quantity / 10)) * price
    }
}

class TenPercentDiscount: DiscountStrategy {
    
    public func getDiscountPrice(quantity: Int, price: Int) -> Int {
        return quantity * (price - (price / 10))
    }
}
