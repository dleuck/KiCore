//
//  File.swift
//  
//
//  Created by Daniel Leuck on 2023/03/08.
//

import Foundation

extension Double: SoftNullable {
    
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
 
