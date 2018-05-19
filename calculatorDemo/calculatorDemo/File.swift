//
//  File.swift
//  calculatorDemo
//
//  Created by mino on 4/15/18.
//  Copyright © 2018 Zainab. All rights reserved.
//

import Foundation
/*func add(op1:Double, op2:Double)->Double{
    return op1+op2
}
func subtract(op1:Double, op2:Double)->Double{
    return op1-op2
}
func multiply(op1:Double, op2:Double)->Double{
    return op1*op2
}
func division(op1:Double, op2:Double)->Double{
       return op1/op2
    
}*/
struct Calculations {

    private var valueBeforeOperand: Double?
    
    private enum operations{
        case constant(Double)
        case unaryOperation((Double)-> (Double))
        case  binaryOperation((Double,Double)-> (Double))
        case equals
        
    }
    
    private var operationSymbols: Dictionary<String, operations> =
        [
            "π" : operations.constant(Double.pi),
            "√" : operations.unaryOperation(sqrt),
            "e" : operations.constant(M_E),
            "C" : operations.constant(Double(0)),
            "=" : operations.equals,
            "+" : operations.binaryOperation({$0 + $1}),
            "-" : operations.binaryOperation({$0 - $1}),
            "*" : operations.binaryOperation({$0 * $1}),
            "/" : operations.binaryOperation({$0 / $1}),
            "^" : operations.binaryOperation{(pow($0 , $1))}
            
    ]
    
    mutating  func performOperation (_ symbol:String){
    if let operation = operationSymbols[symbol]{
        switch operation {
        case .constant(let opVAlue):
            valueBeforeOperand = opVAlue
        case .unaryOperation(let function):
            if valueBeforeOperand != nil{
                valueBeforeOperand = function(valueBeforeOperand!)
            }
        case .binaryOperation(let function):
            if valueBeforeOperand != nil
            {
            pbo = pendingBinaryOperation(function: function, firstOperand: valueBeforeOperand!)
                valueBeforeOperand = nil
            }
        case .equals:
        performPendingOperation()
        
    }
  }
}
    
    private mutating func performPendingOperation(){
    if pbo != nil && valueBeforeOperand != nil
        {
            valueBeforeOperand = pbo?.doOperation(with: valueBeforeOperand!)
            pbo = nil
    
        }
    }
    private var pbo: pendingBinaryOperation?
    struct pendingBinaryOperation {
        let function: (Double, Double)-> Double
        let firstOperand: Double
        
        func doOperation(with secondOperand:Double)-> Double{
            return function(firstOperand, secondOperand)
        }
    }
    
       /* switch symbol {
        case "π":
            //            screen?.text = String(Double.pi)
            valueBeforeOperand = Double.pi
        case "√":
            //            screen?.text = String(sqrt(Double(screen!.text!)!))
            if let operand = valueBeforeOperand{
            valueBeforeOperand = sqrt(operand)
            }
        default:
            
            break
        }*/
    
    mutating func setOperand(_ operand:Double)
    {
        valueBeforeOperand = operand
    }
    var result:Double?{
        get{
            return valueBeforeOperand
        }
        
    }
}
