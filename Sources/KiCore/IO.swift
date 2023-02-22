//
//  IO.swift
//  
//
//  Created by Daniel Leuck on 2023/02/22.
//

import Foundation

public struct IO {
    
    public static func readInput() -> String {
        let line = readLine()
        return line == nil ? "" : line!.trim()
    }
    
    public static func readIntInput() throws -> Int {
        let line = readLine()
        
        if line == nil {
            throw CLIError.nilValue
        }
        
        let numLine = line!.trim()
        
        if numLine.isEmpty {
            throw CLIError .emptyValue
        }
        
        if let value = Int(numLine) {
            return value
        } else {
            throw CLIError.malformedNumber(numLine)
        }
    }
}

public func ask(_ prompt: String = "•> ") -> String {
    print("\(prompt) ", terminator: "")
    let answer = IO.readInput()
    return answer
}

public func askInt(_ prompt: String = "•> ") throws -> Int {
    print("\(prompt) ", terminator: "")
    let answer = try IO.readIntInput()
    return answer
}

enum CLIError: Error {
    case nilValue
    case emptyValue
    case malformedNumber(_ text: String)
}

extension CLIError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .nilValue:
            return "Expected an Int but got a nil value."
        case .emptyValue:
            return "Expected an Int but got an empty String value."
        case .malformedNumber(let text):
            return "Expected an Int but got a malformed String: \(text)"
        }
    }
}
