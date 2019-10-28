//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
var tips = 0.0
var splitNumber = 1.0
var billResult = 0.0
var inputBill:Double = 0
var tipsTitle = "10%"
var billBrain = BillBrain()

class CalculateViewController: UIViewController {
    @IBOutlet weak var billTextFiled: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextFiled.endEditing(true)
        tips = 0.1
        
    }
    
    @IBAction func tipChanged(_ sender:UIButton) {
        billTextFiled.endEditing(true)
        tipsTitle = sender.currentTitle!
        switch sender.currentTitle {
        case "0%":
            zeroButton.isSelected = true
            tenButton.isSelected = false
            twentyButton.isSelected = false
            tips = 0.0
        case "10%":
            tenButton.isSelected = true
            twentyButton.isSelected = false
            zeroButton.isSelected = false
            tips = 0.1
        case "20%":
            twentyButton.isSelected = true
            zeroButton.isSelected = false
            tenButton.isSelected = false
            tips = 0.2
        default:
            tenButton.isSelected = true
            tips = 0.1
        }
        
        
        
    }
    
    
    
    @IBAction func splitSteperChange(_ sender: UIStepper) {
        splitStepper.maximumValue = 12
        splitNumber = sender.value
        splitNumberLabel.text = billBrain.getSplitLabel(splitNumber: splitNumber)
       
    }
    @IBAction func billInputEnd(_ sender: UITextField) {
        inputBill = Double(billTextFiled.text!) as! Double
        
        print(inputBill)
    }
    
    @IBAction func calculateButtonPress(_ sender: UIButton) {
        billBrain.calculateBill(tips:tips, splitNumber: splitNumber,inputBill: inputBill)
        print(billBrain.getBillResultText())
        self.performSegue(withIdentifier: "toResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.resultText = billBrain.getBillResultText()
        destinationVC.infoText = "Split between \(billBrain.getSplitLabel(splitNumber: splitNumber)) people,with \(tipsTitle ) tip."
        
        // Pass the selected object to the new view controller.
    }
    

}

