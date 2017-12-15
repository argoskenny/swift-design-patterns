//
//  StrategyClientViewController.swift
//  design-patterns
//
//  Created by Kenny Lin on 2017/12/1.
//  Copyright © 2017年 Kenny Lin. All rights reserved.
//

import UIKit

class StrategyClientViewController: UIViewController {

    let productData: ProductData = ProductData(name: "Cool Hat", quantity: 0, price: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Strategy Pattern"
        initBackground()
        initProductInfo()
        initEditItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initBackground() {
        view.backgroundColor = UIColor.white
    }
    
    func initProductInfo() {
        let productName: UILabel = UILabel(frame: CGRect(x: 20.0, y: 100.0, width: 300.0, height: 40.0))
        let productPrice: UILabel = UILabel(frame: CGRect(x: 20.0, y: 150.0, width: 300.0, height: 40.0))
        productName.text = "Product Name: " + productData.name
        productPrice.text = "Product Price: " + String(productData.price)
        view.addSubview(productName)
        view.addSubview(productPrice)
    }
    
    func initEditItems() {
        let quantityLabel: UILabel = UILabel(frame: CGRect(x: 20.0, y: 200.0, width: 100.0, height: 40.0))
        quantityLabel.text = "Quantity: "
        let quantityTextField: UITextField = UITextField(frame: CGRect(x: 120.0, y: 200.0, width: 50.0, height: 40.0))
        quantityTextField.borderStyle = UITextBorderStyle.roundedRect
        quantityTextField.textAlignment = NSTextAlignment.center
        quantityTextField.keyboardType = UIKeyboardType.numberPad
        quantityTextField.textColor = UIColor.blue
        quantityTextField.text = "1"
        view.addSubview(quantityLabel)
        view.addSubview(quantityTextField)
    }

}
