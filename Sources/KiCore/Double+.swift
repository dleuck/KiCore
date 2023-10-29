//
//  File.swift
//  
//
//  Created by Daniel Leuck on 2023/03/08.
//

import Foundation

extension Double: SoftNullable {
    
    public static let percentRange = 0.0...100.0
    
    /// Conforms to SoftNullable - we use isNaN as the equivalent of a soft null
    public var isNull: Bool {
        return self.isNaN
    }
            
    /// Rounds the double to decimal places value
    public func rounded(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

/**
 * Returns a Double between num1 and num2.
 */
public func between(_ num1: Double, _ num2: Double, percent: Double = 0.5) -> Double {
    let percent = percent.clamp(Double.percentRange)
    let distance = num1.distance(to: num2)
    
    return num1 + (distance * percent)
}

/**
 * Specify the decimal place to round to using an enum
 */
public enum RoundingPrecision {
    case ones
    case tenths
    case hundredths
    case thousandths
}

/**
 * Round to the specific decimal place
 */
public func preciseRound(
    _ value: Double,
    precision: RoundingPrecision = .ones) -> Double {
    switch precision {
        case .ones:
            return round(value)
        case .tenths:
            return round(value * 10) / 10.0
        case .hundredths:
            return round(value * 100) / 100.0
        case .thousandths:
            return round(value * 1000) / 1000.0
    }
}

