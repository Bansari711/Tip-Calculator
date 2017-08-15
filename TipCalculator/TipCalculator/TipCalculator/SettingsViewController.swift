//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Bansari on 8/10/17.
//  Copyright © 2017 Bansari. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var excellentServiceTipPercentageLabel: UILabel!
    @IBOutlet weak var satisfactoryServiceTipPercentageLabel: UILabel!
    @IBOutlet weak var averageServiceTipPercentageLabel: UILabel!
    
    let excellentServiceTip = 25
    let satisfactoryServiceTip = 20
    let averageServiceTip = 18
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadDataFromPlist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDataFromPlist() {
        let path = Bundle.main.path(forResource: "TipSettings", ofType: "plist")
        print(path!)
        
        let url = URL(fileURLWithPath: path!)
        print(url)
        
        let obj = NSDictionary(contentsOf: url)
        
        if let str = obj!.value(forKey: "ExcellentServiceTip"){
            self.excellentServiceTipPercentageLabel.text = str as? String ?? ""
        }
        if let str = obj!.value(forKey: "SatisfactoryServiceTip"){
            self.satisfactoryServiceTipPercentageLabel.text = str as? String ?? ""
        }
        if let str = obj!.value(forKey: "AverageServiceTip"){
            self.averageServiceTipPercentageLabel.text = str as? String ?? ""
        }
    }
    
    @IBAction func increaseExcellentServiceTipPercentageBtn(_ sender: Any) {
        excellentServiceTipPercentageLabel.text = String(format: "%d", Int(excellentServiceTipPercentageLabel.text!)! + 1)
    }
    
    @IBAction func decreaseExcellentServiceTipPercentageBtn(_ sender: Any) {
        if (Int(excellentServiceTipPercentageLabel.text!)! > 0){
            excellentServiceTipPercentageLabel.text = String(format: "%d", Int(excellentServiceTipPercentageLabel.text!)! - 1)
        }
    }
    
    @IBAction func increaseSatisfactoryServiceTipPercentageBtn(_ sender: Any) {
        satisfactoryServiceTipPercentageLabel.text = String(format: "%d", Int(satisfactoryServiceTipPercentageLabel.text!)! + 1)
    }
    
    @IBAction func decreaseSatisfactoryServiceTipPercentageBtn(_ sender: Any) {
        if (Int(satisfactoryServiceTipPercentageLabel.text!)! > 0){
            satisfactoryServiceTipPercentageLabel.text = String(format: "%d", Int(satisfactoryServiceTipPercentageLabel.text!)! - 1)
        }
    }
    
    @IBAction func increaseAverageServiceTipPercentageBtn(_ sender: Any) {
        averageServiceTipPercentageLabel.text = String(format: "%d", Int(averageServiceTipPercentageLabel.text!)! + 1)
    }
    
    @IBAction func decreaseAverageServiceTipPercentageBtn(_ sender: Any) {
        if (Int(averageServiceTipPercentageLabel.text!)! > 0){
            averageServiceTipPercentageLabel.text = String(format: "%d", Int(averageServiceTipPercentageLabel.text!)! - 1)
        }
    }
    
    @IBAction func saveTipSettings(_ sender: Any) {
        saveTipSettings()
    }
    
    func saveTipSettings() {
        let path = Bundle.main.path(forResource: "TipSettings", ofType: "plist")
        print(path!)
        
        let url = URL(fileURLWithPath: path!)
        print(url)
        
        let excellentServiceTip = excellentServiceTipPercentageLabel.text
        let dict = NSMutableDictionary()
        dict.setValue(excellentServiceTip, forKey: "ExcellentServiceTip")
        dict.write(to: url, atomically: true)
        
        let satisfactoryServiceTip = satisfactoryServiceTipPercentageLabel.text
        dict.setValue(satisfactoryServiceTip, forKey: "SatisfactoryServiceTip")
        dict.write(to: url, atomically: true)
        
        let averageServiceTip = averageServiceTipPercentageLabel.text
        dict.setValue(averageServiceTip, forKey: "AverageServiceTip")
        dict.write(to: url, atomically: true)
    }
    
    @IBAction func resetTipSettings(_ sender: Any) {
        excellentServiceTipPercentageLabel.text = String(format: "%d", excellentServiceTip)
        satisfactoryServiceTipPercentageLabel.text = String(format: "%d", satisfactoryServiceTip)
        averageServiceTipPercentageLabel.text = String(format: "%d", averageServiceTip)
        saveTipSettings()
    }
}
