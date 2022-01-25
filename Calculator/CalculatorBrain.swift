//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil{
            operand1String.append(digit)
            return operand1String
        } else {
            operand2String.append(digit)
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        if let newOperator = OperatorType(rawValue: operatorString) {
            operatorType = newOperator
        }
    }
    
    func calculateIfPossible() -> String? {
        let answer: Double
        if let op1 = Double(operand1String), let op2 = Double(operand2String), let calcOperator = operatorType {
            switch (calcOperator) {
                case .addition:
                    answer = op1 + op2
                case .division:
                    if op2 != 0{
                        answer = op1 / op2
                    } else {
                        return "Error"
                    }
                case .multiplication:
                    answer = op1 * op2
                case .subtraction:
                    answer = op1 - op2
            }
            return String(answer)
        } else {
            return nil
        }
    }
}
