//
//  ViewController.swift
//  Prework_Intermediate_IOS
//
//  Created by Noah Pilkington on 7/26/22.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var GifView: UIImageView!
    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    // party size control
    @IBOutlet weak var PartySizeLabel: UILabel!
    @IBAction func stepper(_ sender: UIStepper)
    {
        PartySizeLabel.text = String(sender.value)
    }
    // end of party size control
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //automatic keyboard popup
        billAmountTextField.becomeFirstResponder()
        
        GifView.loadGif(name: "gif")
    }
    
        // CALCULATE TIP FUNCT
    @IBAction func calculateTip(_ sender: Any) {
        //code here
        // get bill amount from text feild input
        
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // get total tip by multiplying tip * tippercentage
        
        let partysize = Double(PartySizeLabel.text!) ?? 1//declaring partysize
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip) / partysize
        
        //update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

