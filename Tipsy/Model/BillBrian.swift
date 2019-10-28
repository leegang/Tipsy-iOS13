//
//  BillBrian.swift
//  Tipsy
//
//  Created by 张雪 on 2019/10/28.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct BillBrain {

    var splitLabelText = "0.0"
    var billResultText = "0.0"
    
    mutating func calculateBill(tips:Double,splitNumber:Double,inputBill:Double){
        billResult = ( inputBill * (1 - tips) ) / splitNumber
    }
    
    mutating func getBillResultText() -> String {
        billResultText = String(format: "%.4f", billResult)
        return billResultText
    }
    
    mutating func getSplitLabel(splitNumber:Double!) -> String{
        splitLabelText = String(format:"%.0f",splitNumber)
        return splitLabelText
    }
}

