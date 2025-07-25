//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"

    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        // to dismissed the number keyboard
        billTextField.endEditing(true)
        
        // desselect all the button by UIOutlet
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // to make user select the button
        sender.isSelected = true
        
        // to get the current tittle the user is selected
        let buttonTitle = sender.currentTitle!
        
        // to remove the last character (%) from the title and turn back into the string
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
                
        //Turn the String into a Double.
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
                
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTitleAsANumber / 100
        print(tip)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //Get the stepper value using sender.value, round it down to a whole number then set it as the text in
        //splitNUmberLabel
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        //Set the numberOfPeople property as the value of the stepper as a whole number.
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(numberOfPeople)
        
        //Get the text the user typed in the billTextField
               let bill = billTextField.text!
               
               //If the text is not an empty String ""
        if bill != "" {
            
            //Turn the bill from a String e.g. "123.50" to an actual String with decimal places.
            //e.g. 125.50
            billTotal = Double(bill)!
            
            //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            //Round the result to 2 decimal places and turn it into a String.
            finalResult = String(format: "%.2f", result)
            print(result)
            
            performSegue(withIdentifier: "goToResult", sender: self)
            
        }
    }
    //This method gets triggered just before the segue starts.
   override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "goToResult" {
            //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
                        let destinationVC = segue.destination as! ResultViewController
                        
                        //Set the destination ResultsViewController's properties.
                        destinationVC.result = finalResult
                        destinationVC.tip = Int(tip * 100)
                        destinationVC.split = numberOfPeople
        }
    }
}

