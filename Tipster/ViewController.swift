//
//  ViewController.swift
//  Tipster
//
//  Created by Kioja Kudumu on 11/1/17.
//  Copyright © 2017 Kioja Kudumu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var percentLabel1: UILabel!
    @IBOutlet weak var percentLabel2: UILabel!
    @IBOutlet weak var percentLabel3: UILabel!
    @IBOutlet weak var taxLabel1: UILabel!
    @IBOutlet weak var taxLabel2: UILabel!
    @IBOutlet weak var taxLabel3: UILabel!
    @IBOutlet weak var afterTaxLabel1: UILabel!
    @IBOutlet weak var afterTaxLabel2: UILabel!
    @IBOutlet weak var afterTaxLabel3: UILabel!
    
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSlider: UISlider!
    @IBOutlet weak var decimalKey: UIButton!
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if totalLabel.text == "0" && sender.tag < 10 {
            totalLabel.text = String(sender.tag)
        }
        else if totalLabel.text == "0" && sender.tag == 11 {
            totalLabel.text = "0."
            sender.isEnabled = false
        }
        else if sender.tag < 10 {
            if let totalText = totalLabel.text {
                totalLabel.text = totalText + String(sender.tag)
            }
        }
        else if sender.tag == 11 {
            if let totalText = totalLabel.text {
                totalLabel.text = totalText + "."
                sender.isEnabled = false
            }
        }
        else if sender.tag == 10 {
            totalLabel.text = String(0)
            decimalKey.isEnabled = true
        }
        tipCalc()
    }
    
    func tipCalc() {
        if let inputString = totalLabel.text {
            let input = Double(inputString)
            let tip = Double(round(tipSlider.value * 10))
            let group = Double(round(groupSlider.value * 20) + 1)
            let minimumTip = Double(input!*(tip/100))
            let minPerPerson = (input! + minimumTip)/group
            let mediumTip = Double((input! * (tip + 5))/100)
            let medPerPerson = (input! + mediumTip)/group
            let maximumTip = Double((input! * (tip + 10))/100)
            let maxPerPerson = (input! + maximumTip)/group
            taxLabel1.text = String(format: "%.2f", minimumTip)
            taxLabel2.text = String(format: "%.2f", mediumTip)
            taxLabel3.text = String(format: "%.2f", maximumTip)
            afterTaxLabel1.text = String(format: "%.2f", minPerPerson)
            afterTaxLabel2.text = String(format: "%.2f", medPerPerson)
            afterTaxLabel3.text = String(format: "%.2f", maxPerPerson)
        }
    }
    
    @IBAction func tipSliderCalc(_ sender: Any) {
        percentLabel1.text = String(Int(round(tipSlider.value*10))) + "%"
        percentLabel2.text = String(Int(round(tipSlider.value*10)) + 5) + "%"
        percentLabel3.text = String(Int(round(tipSlider.value*10)) + 10) + "%"
        tipCalc()
    }
    
    @IBAction func groupSliderCalc(_ sender: Any) {
        groupLabel.text = String(Int(round(groupSlider.value * 20) + 1))
        tipCalc()
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

