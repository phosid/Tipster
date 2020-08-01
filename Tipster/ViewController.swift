//
//  ViewController.swift
//  Tipster
//
//  Created by Sidney Pho on 7/30/20.
//  Copyright © 2020 Sidney Pho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipPercentages: UISegmentedControl!
    @IBOutlet weak var funnyText: UILabel!
    @IBOutlet weak var tipAmountField: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var totalAmountField: UILabel!
    @IBOutlet weak var sliderNumber: UILabel!
    @IBOutlet weak var pricePerPerson: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountField.text!) ?? 0
        let tipPercentageValues = [0.15, 0.22, 0.27, 0.35]
        let tipAmount = bill * tipPercentageValues[tipPercentages.selectedSegmentIndex]
        tipAmountField.text = String(format: "%.2f", tipAmount)
        totalAmountField.text = String(format: "%.2f", tipAmount+bill)
    }
    
    @IBAction func tipChange(_ sender: Any) {
        if (tipPercentages.selectedSegmentIndex == 0) {
            funnyText.text = "I guess I have some change to spare..."
        } else if (tipPercentages.selectedSegmentIndex == 1) {
            funnyText.text = "The service was pretty decent, and they gave us some fortune cookies..."
        } else if (tipPercentages.selectedSegmentIndex == 2) {
            funnyText.text = "Am I eating at a 5 star restaurant? Amazing service!"
        } else if (tipPercentages.selectedSegmentIndex == 3) {
            funnyText.text = "PLEASE TAKE MY MONEY! Out-of-this-world, mind-blowing service."
        }
    }
    
    @IBAction func editingSliderValue(_ sender: Any) {
        sliderNumber.text = String(format: "%.0f", slider.value)
    }
    
    @IBAction func changeSlider(_ sender: UISlider) {
        
        let bill = Double(billAmountField.text!) ?? 0;
        slider.value = roundf(slider.value);
        let tipPercentageValues = [0.15, 0.22, 0.27, 0.35]
        let tipAmount = bill * tipPercentageValues[tipPercentages.selectedSegmentIndex]
        let total = bill + tipAmount;
        let finalPriceDivided = (total)/(Double)(slider.value);
        if (total == 0.00) {
            pricePerPerson.text = "0.00";
        } else {
            pricePerPerson.text = String(format: "%.2f", finalPriceDivided);
        }
    }
}

