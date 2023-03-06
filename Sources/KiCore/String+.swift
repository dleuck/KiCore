//
//  String.swift
//  
//
//  Created by Daniel Leuck on 2023/02/22.
//

import Foundation

public extension String {
    
    func isAlphaNumeric() -> Bool {
        return rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && !isEmpty
        /*
        var modValue = self
        if modValue.hasPrefix("-") { modValue.removeFirst() }
        return modValue.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) ==
            nil && !isEmpty
        */
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func trimLeft() -> String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0))
            .isSubset(of: .whitespacesAndNewlines) }) else {
            return self.trim()
        }
        return String(self[index...])
    }
    
    func trimRight() -> String {
        if isEmpty { return "" }
        
        let charSet = chars
        var stopIndex = count-1
        
        for i in (0...count-1).reversed() {
            if charSet[i].isWhitespace {
                stopIndex-=1
            } else {
                break
            }
        }
        
        return String(charSet[...stopIndex])
    }
    
    /**
     * Returns all the characters before the first occurance of substring. If substring does not
     * occur, return nil.
     */
    func before(_ substring:String) -> String? {
        if let range = range(of: substring) { return String(self[..<range.lowerBound]) }
        return nil
    }
    
    /**
     * Returns all the characters before the first occurance of char. If char does not occur, return
     * nil.
     */
    func before(_ char: Char) -> String? {
        if let index = firstIndex(of: char) {
            let before = prefix(upTo: index)
            return String(before)
        }
        return nil
    }
    
    /**
     * Returns all the characters before the last occurance of substring. If substring does not
     * occur, return nil.
     */
    func beforeLast(_ substring:String) -> String? {
        if let range = description.range(of: substring, options:String.CompareOptions.backwards) {
            return String(self[..<range.lowerBound])
        }
        
        return nil
    }
    
    /**
     * Returns all the characters before the last occurance of char. If char does not occur,
     * return nil.
     */
    func beforeLast(_ char:Char) -> String? {
        if let index = lastIndex(of: char) {
            let before = prefix(upTo: index)
            return String(before)
        }
        
        return nil
    }
    
    ////
    
    func after(_ substring:String) -> String? {
        
        if let range = range(of: substring) {
            return String(self[range.upperBound...])
        }
        
        return nil
    }
    
    func after(_ char:Char) -> String? {
        if let index = firstIndex(of: char) {
            return String(self[index...].dropFirst())
        }
        
        return nil
    }

    func afterLast(_ substring:String) -> String? {
        if let range = description.range(of: substring, options:NSString.CompareOptions.backwards) {
            return String(self[range.upperBound...])
        }
        
        return nil
    }
    
    func afterLast(_ char:Char) -> String? {
        if let index = lastIndex(of: char) {
            return String(self[index...].dropFirst())
        }
        
        return nil
    }
    
    ////
    
    var chars: [Character] {
       return Array(self)
    }
    
    func replaceAll(_ oldString:String, _ newString:String) -> String {
        return replacingOccurrences(of: oldString, with: newString)
    }
    
    func removeAll(_ string:String) -> String {
        return replaceAll(string, "")
    }
    
    func count(_ char: Char) -> Int {
        return filter { $0 == char }.count
    }
    
    // Indexes
    
    func index(_ string: CustomStringConvertible, options: String.CompareOptions = []) -> Index? {
        return range(of: string.description, options: options)?.lowerBound
    }
    
    func indexEnd(_ string: CustomStringConvertible, options: String.CompareOptions = [])
        -> Index? {
        return range(of: string.description, options: options)?.upperBound
    }
    
    func lastIndex(_ string: CustomStringConvertible) -> Index? {
        return range(of: string.description, options: .backwards)?.lowerBound
    }
    
    func lastIndexEnd(_ string: CustomStringConvertible) -> Index? {
        return range(of: string.description, options: .backwards)?.upperBound
    }
    
    // Emoji related methods
    
    var isSingleEmoji: Bool {
        return count == 1 && containsEmoji
    }

    var containsEmoji: Bool {
        return contains { $0.isEmoji }
    }

    var containsOnlyEmoji: Bool {
        return !isEmpty && !contains { !$0.isEmoji }
    }

    var emojiString: String {
        return emojis.map { String($0) }.reduce("", +)
    }

    var emojis: [Character] {
        return filter { $0.isEmoji }
    }

    var emojiScalars: [UnicodeScalar] {
        return filter{ $0.isEmoji }.flatMap { $0.unicodeScalars }
    }
}

extension [Character] {
    var string: String { return String(self) }
}

extension Array<Character>.SubSequence {
    var string: String { return String(self) }
}

/**
 Produces a String representation of any object
 */
func toString(_ obj: Any?) -> String {
    if obj == nil {
        return "nil"
    } else if obj is String {
        return
            """
            "\(String(describing: obj!))"
            """
    } else {
        return String(describing: obj!)
    }
}

