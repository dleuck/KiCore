//
//  Character+.swift
//  
//
//  Created by Daniel Leuck on 2023/02/22.
//

import Foundation

// Note: This includes code in a response by Kevin R on StackOverflow:
//   https://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
public extension Character {
    
    static var fractions = "½⅓⅔¼¾⅛⅜⅝⅞", exponents = "⁰¹²³⁴⁵⁶⁷⁸⁹"
    
    var isAlphaNumeric: Bool { isLetter || isNumber }
    
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
    
}

