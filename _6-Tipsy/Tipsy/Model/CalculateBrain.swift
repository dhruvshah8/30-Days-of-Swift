//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by Dhruv Shah on 2020-05-22.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var totalBill: Double
    var totalPeople: Double
    var totalTip: Double
    
    
    init(bill: Double,tip: Double, people: Double) {
        totalBill = bill
        totalPeople = people
        totalTip = tip
    }
    
    func calculateSplitBill() -> Double {
        
        let total = ((totalTip*totalBill) + totalBill)/totalPeople
        return total
    }
    
}
