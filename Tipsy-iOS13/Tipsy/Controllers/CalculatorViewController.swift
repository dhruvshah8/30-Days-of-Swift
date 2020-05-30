//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billTextFeild: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var string1 = "10"
    var totalPeople = 2
    var splitPresent = 0.0
    
    
    override func viewDidLoad() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        string1 = sender.currentTitle!
        
        switch string1 {
        case "0%":
            tip = 0.0
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case "10%":
            tip = 0.1
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case "20%":
            tip = 0.2
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
        default:
            tip = 0.1
        }
        print(tip)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        totalPeople = Int(sender.value)
        splitNumberLabel.text = ("\(totalPeople)")
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let totalBill = Double(billTextFeild.text!)!
       
        let brain = CalculatorBrain(bill: Double(totalBill), tip: tip, people: Double(totalPeople))
         splitPresent = (brain.calculateSplitBill())
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
          
    }
    
 
    
    override func prepare(for segue : UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController

            destinationVC.totalPresentValue = (splitPresent)
            
        }
        
    }
    

    
}

