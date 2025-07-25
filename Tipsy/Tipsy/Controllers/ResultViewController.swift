//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Akash Yadav on 23/07/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = "0.0"
    var split = 2
    var tip = 10
    
    
    override func viewDidLoad() {
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people with a \(tip)% tips."
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
