//
//  File.swift
//  
//
//  Created by Daniel Leuck on 2023/03/06.
//

import Foundation

/**
 The Chars struct is a useful replacement for Strings for text manipulation and parsing heavy
 applications. While this is usually not as efficient or compact as a String when stored, the
 Chars struct is ideal for parsing because Int can be used instead of String.Index for addressing
 char indexes and ranges. Counts are always reliable, and the Char struct is unicode friendly and
 and emoji safe.
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
    
    public var isEmpty: Bool { chars.count == 0 }
    
    /**
     * Returns the first char or Char.null if the Chars is empty.
     */
    public var first: Char { return isEmpty ? Char.null : chars[0] }
    
    /**
     * Returns the last char or Char.null if the Chars is empty.
     */
    public var last: Char { return isEmpty ? Char.null : chars[chars.count-1] }

    public func hasPrefix(_ prefix: String) -> Bool { string.hasPrefix(prefix)}

    public func dropPrefix(_ prefix: String) -> Chars {
        return hasPrefix(prefix) ? dropFirst(prefix.count) : self
    }

    public func hasSuffix(_ suffix: String) -> Bool { string.hasSuffix(suffix) }
    
    public func dropSuffix(_ suffix: String) -> Chars {
        return hasSuffix(suffix) ? dropLast(suffix.count) : self
    }
    
    public func trim() -> Chars { Chars(string.trim()) }
    
    public func dropLast() -> Chars { Chars(chars.dropLast()) }
    
    public func dropLast(_ count: Int) -> Chars { Chars(chars.dropLast(count)) }
    
    public func dropFirst() -> Chars { Chars(chars.dropFirst()) }
    
    public func dropFirst(_ count: Int) -> Chars { Chars(chars.dropFirst(count)) }
    
    // TODO: Expand to include any char sequence or regex

    public func split(_ separator: String) -> [Chars] {
        let tokens = string.split(separator: separator)
        let newArray = tokens.map { Chars($0) }
        return [Chars](newArray)
    }
    
    public func contains(_ text: Chars) -> Bool { string.contains(text.string) }
    
    public func contains(_ text: String) -> Bool { return string.contains(text) }
    
    public mutating func replaceRange(_ range: ClosedRange<Int>, with: any Collection<Char>) {
        chars.replaceSubrange(range, with: with)
    }
    
    // TODO replaceFirst, replaceLast, replaceAll for Chars and Regex
    
    public mutating func write(_ string: String) { add(string) }
    
    // operators

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
    
    // TODO - Regex methods
}
