//
//  Operators.swift
//  
//
//  Created by Daniel Leuck on 2023/02/22.
//

import Foundation

// Log operators
prefix operator »

@discardableResult
prefix func » (obj: Any?) -> String {
    var text: String
    
    if obj == nil {
        text = "nil"
    } else {
        text = toString(obj) + " (\(String(describing: type(of: obj!).self)))"
    }

    print(text)
    return text
}

