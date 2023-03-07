//
//  File.swift
//  
//
//  Created by Daniel Leuck on 2023/03/06.
//

import Foundation

/**
 * TODO: Complete implementation
 */
public struct Chars: ExpressibleByStringLiteral, ExpressibleByStringInterpolation,
                     CustomStringConvertible, TextOutputStream, Comparable, Equatable,
                     ExpressibleByArrayLiteral, Sequence {
    

    public typealias Element = Char
    public typealias ArrayLiteralElement = Char
    public typealias StringLiteralType = String
    
    internal var chars: [Character]

    // Public
    
    public init() { chars = [Char]() }
    
    public init(stringLiteral: Self.StringLiteralType) { self.chars = stringLiteral.charArray }
    
    public init(_ charArray: [Char]) { self.chars = charArray }
    
    public init(_ charSequence: any Sequence<Char>) {
        chars = [Char]()
        chars.append(contentsOf: charSequence)
    }
    
    /**
     * Redudant with public init(_ charArray: [Char]) but needed for conformance with
     * ExpressibleByArrayLiteral
     */
    public init(arrayLiteral chars: Char...) { self.chars = chars }
    
    public var description: String { String(chars) }
    
    public var string: String { String(chars) }
    
    public var charArray: [Char] { chars }
    
    public var count: Int { chars.count }
    
    public mutating func add(_ value: Char) { chars.append(value) }
    
    public mutating func add(_ value: any Sequence<Char>) { chars.append(contentsOf: value) }
    
    public subscript(index: Int) -> Char { chars[index] }
    
    public subscript(range: ClosedRange<Int>) -> Chars { Chars(chars[range]) }
    
    public subscript(range: PartialRangeFrom<Int>) -> Chars { Chars(chars[range]) }

    public subscript(range: PartialRangeThrough<Int>) -> Chars { Chars(chars[range]) }
    
    public var first: Char? { chars.first }
    
    public func dropFirst() -> Chars { Chars(chars.dropFirst()) }
    
    public var last: Char? { chars.last }
    
    public func dropLast() -> Chars { Chars(chars.dropLast()) }
    
    public func hasPrefix(_ prefix: String) -> Bool { string.hasPrefix(prefix)}

    public func hasSuffix(_ suffix: String) -> Bool { string.hasSuffix(suffix) }
    
    public func trim() -> Chars { Chars(string.trim()) }
    
    public mutating func replaceRange(_ range: ClosedRange<Int>, with: any Collection<Char>) {
        return chars.replaceSubrange(range, with: with)
    }
    
    public mutating func write(_ string: String) {
        add(string)
    }
    
    public static func == (lhs: Chars, rhs: Chars) -> Bool { lhs.chars == rhs.chars }
    
    public static func < (lhs: Chars, rhs: Chars) -> Bool { lhs.description < rhs.description }
    
    public static func + (lhs: Chars, rhs: CustomStringConvertible) -> Chars {
        Chars(lhs.string + rhs.description)
    }
    
    public static func + (lhs: Chars, rhs: any Sequence<Char>) -> Chars {
        var newChars = lhs
        newChars.add(rhs)
        
        return newChars
    }
    
    public static func + (lhs: Chars, rhs: Char) -> Chars {
        var newChars = lhs
        newChars.add(rhs)
        
        return newChars
    }
    
    public func makeIterator() -> String.Iterator {
        return string.makeIterator()
    }
}
