//
//  Character+.swift
//  
//
//  Created by Daniel Leuck on 2023/02/22.
//

import Foundation

// Note: This includes code in a response by Kevin R on StackOverflow:
//   https://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
public extension Char {
    
    static var fractions = "½⅓⅔¼¾⅛⅜⅝⅞", exponents = "⁰¹²³⁴⁵⁶⁷⁸⁹"
    static var null: Char = "\u{0000}"

    var isAlphanumeric: Bool { isLetter || isNumber }
    
    var isFraction : Bool { Character.fractions.contains(self) }
    
    var isExponent : Bool { return Character.exponents.contains(self) }
    
    /// A simple emoji is a single scalar presented to the user as an Emoji
    var isSimpleEmoji: Bool {
        guard let firstProperties = unicodeScalars.first?.properties else {
            return false
        }
        return unicodeScalars.count == 1 &&
            (firstProperties.isEmojiPresentation ||
                firstProperties.generalCategory == .otherSymbol)
    }

    /// Checks if the scalars will be merged into an emoji
    var isCombinedIntoEmoji: Bool {
        return unicodeScalars.count > 1 &&
            unicodeScalars.contains { $0.properties.isJoinControl ||
                $0.properties.isVariationSelector }
    }

    var isEmoji: Bool { isSimpleEmoji || isCombinedIntoEmoji }
    
    /**
     * Soft null conformance
     */
    /*
    var isNull: Bool {
        self == Char.null
    }
    */
}

extension Char : SoftNullable {
    
    /// Conforms to SoftNullable - we use Char.null (\\u{0000}) as the equivalent of a soft null
    public var isNull: Bool {
        self == Char.null
    }
}



