//
//  ViewController.swift
//  TipCalculator
//
//  Created by Bansari on 8/10/17.
//  Copyright © 2017 Bansari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var noOfPeopleLabel: UILabel!
    @IBOutlet weak var amountPerPersonLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    var isAnimationOnServiceButtonsPerformed = false
    
    @IBOutlet weak var satisfactoryServiceButtonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        satisfactoryServiceButtonConstraint.constant -= view.bounds.width
    }
    
    override func viewWillAppear(_ animated: Bool) {
        billTextField.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (!isAnimationOnServiceButtonsPerformed){
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.satisfactoryServiceButtonConstraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            isAnimationOnServiceButtonsPerformed = true
        }
        
        let billAmount = UserDefaults.standard.object(forKey: "BillAmount")
        print(billAmount ?? "hi")
        if billAmount != nil {
            billTextField.text = billAmount as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTipBillTextField(_ sender: Any) {
        let tipPercentage = Int(tipPercentageLabel.text!)
        
        calculateTipAmount(tipPercentage: tipPercentage!)
    }
    
    @IBAction func excellentServiceTipBtn(_ sender: Any) {
        setServiceTip(serviceRate: "ExcellentServiceTip")
        
        bounceServiceButtons(sender: sender as! UIButton)
    }
    
    @IBAction func satisfactoryServiceTipBtn(_ sender: Any) {
        setServiceTip(serviceRate: "SatisfactoryServiceTip")
        
        bounceServiceButtons(sender: sender as! UIButton)
    }

    @IBAction func averageServiceTipBtn(_ sender: Any) {
        setServiceTip(serviceRate: "AverageServiceTip")
        
        bounceServiceButtons(sender: sender as! UIButton)
    }

    @IBAction func increaseTipPercentageBtn(_ sender: Any) {
        let tipPercentage = Int(tipPercentageLabel.text!)! + 1
        calculateTipAmount(tipPercentage: tipPercentage)
    }
    
    @IBAction func decreaseTipPercentageBtn(_ sender: Any) {
        let tipPercentage = Int(tipPercentageLabel.text!)! - 1
        
        if(tipPercentage >= 0){
            calculateTipAmount(tipPercentage: tipPercentage)
        }
    }
    
    @IBAction func increaseNoOfPeople(_ sender: Any) {
        let noOfPeople = Int(noOfPeopleLabel.text!)! + 1
        calculateAmountPerPerson(noOfPeople: noOfPeople)
    }
    
    @IBAction func decreaseNoOfPeople(_ sender: Any) {
        let noOfPeople = Int(noOfPeopleLabel.text!)! - 1
        
        if (noOfPeople > 0){
            calculateAmountPerPerson(noOfPeople: noOfPeople)
        }
    }
    
    @IBAction func saveBillBtn(_ sender: Any) {
        UserDefaults.standard.set(billTextField.text, forKey: "BillAmount")
        UserDefaults.standard.set(tipPercentageLabel.text, forKey: "TipPercentage")
        UserDefaults.standard.set(noOfPeopleLabel.text, forKey: "NoOfPeople")
    }
    
    func setServiceTip(serviceRate:String) {
        let path = Bundle.main.path(forResource: "TipSettings", ofType: "plist")
        print(path!)
        
        let url = URL(fileURLWithPath: path!)
        print(url)
        
        let obj = NSDictionary(contentsOf: url)
        
        if let str = obj!.value(forKey: serviceRate){
            self.tipPercentageLabel.text = str as? String ?? ""
        }
        
        calculateTipAmount(tipPercentage: Int(tipPercentageLabel.text!)!)
    }
    
    func calculateTipAmount(tipPercentage:Int?){
        print(billTextField.text ?? 0)
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * Double(tipPercentage!) / 100
        let noOfPeople = Int(noOfPeopleLabel.text!)!
        
        tipAmountLabel.text = String(format: "%.2f", tip)
        tipPercentageLabel.text = String(format: "%d", tipPercentage!)
        
        calculateAmountPerPerson(noOfPeople: noOfPeople)
    }
    
    func calculateAmountPerPerson(noOfPeople:Int){
        let bill = Double(billTextField.text!) ?? 0
        let tip = Double(tipAmountLabel.text!)
        
        let totalAmount = bill + Double(tip!)
        
        let amountPerPerson = totalAmount / Double(noOfPeople)
        
        amountPerPersonLabel.text = String(format: "%.2f", amountPerPerson)
        noOfPeopleLabel.text = String(format: "%d", noOfPeople)
        totalAmountLabel.text = String(format: "%.2f", totalAmount)
    }
    
    func bounceServiceButtons(sender:UIButton) {
        let button = sender 
        let bounds = button.bounds
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            button.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
        }) { (success:Bool) in
            if success{
                
                UIView.animate(withDuration: 0.5, animations: {
                    button.bounds = bounds
                })
                
                
            }
        }
    }
}

