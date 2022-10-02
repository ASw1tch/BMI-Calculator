//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLAbel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight =  String(format: "%.0f", sender.value)
        weightLAbel.text = "\(weight)kg"
    }
    
    @IBAction func calcultePressed(_ sender: UIButton) {
        let height =  heightSlider.value
        let weight = weightSlider.value
       
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let desinationVC = segue.destination as! ResultViewController
            desinationVC.bmiValue = calculatorBrain.getBMIValue()
            desinationVC.advice = calculatorBrain.getAdvice()
            desinationVC.color = calculatorBrain.getColor()
            
            
            
        
        }
    }
}

