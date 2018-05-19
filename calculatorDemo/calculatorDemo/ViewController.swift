//
//  ViewController.swift
//  calculatorDemo
//
//  Created by mino on 4/13/18.
//  Copyright © 2018 Zainab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var screen: UILabel?
    var userIsTyping = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        let btnValue = sender.currentTitle!
        if userIsTyping{
        print("you pressed \(btnValue)")
        let digitValue = screen!.text!
        screen!.text = digitValue + btnValue
        }else
        {
            screen!.text = btnValue
            userIsTyping = true
        }
        
    }
    var displayValue: Double{
        set (newValue){
            screen!.text! = String(newValue)
            
        }
        get{
            
            return Double(screen!.text!)!
        }
    }

    private var calc = Calculations()
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userIsTyping{
            calc.setOperand(displayValue)
            userIsTyping = false
        
        }
       //
       if let mathematicalOperaton = sender.currentTitle
       {
        calc.performOperation(mathematicalOperaton)
        }
        if let newResult = calc.result {
        displayValue = newResult
        }
    }
    
    
}

