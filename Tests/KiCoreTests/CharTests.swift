//
//  CharsTests.swift
//  
//
//  Created by Daniel Leuck on 2023/03/06.
//

import XCTest
@testable import KiCore

final class CharTests: XCTestCase {
    
    func testInstantiate() throws {
        let foo: Chars = "Hello"
        XCTAssertEqual(foo, "Hello")
    }
    
    func testType() throws {
        let foo: Chars = "Hello"
        XCTAssertEqual("\(type(of: foo))", "Chars")
    }
    
    func testSubscripts() throws {
        let text: Chars = "Hello John"
        XCTAssertEqual(text[0...1], "He")
        XCTAssertEqual(text[2], "l")
        XCTAssertEqual(text[6...], "John")
        XCTAssertEqual(text[...4], "Hello")
    }
    
    func testReplaceRange() throws {
        var text = "aaa bbb".chars
        text.replaceRange(0...2, with: "**")
        XCTAssertEqual(text, "** bbb")
    }
    
    func testSequence() throws {
        let name = "Daniel".chars
        XCTAssertEqual("\(type(of: name))", "Chars")
        print("\(type(of: name))")
        
        var newName = Chars()
        for letter in name {
            newName.add(letter)
        }
        
        XCTAssertEqual(name, newName)
        
        let text1 = "foo".chars
        
        XCTAssertEqual(text1 + "berry", "fooberry")
        XCTAssertEqual("hi" + text1 + "berry", "hifooberry")
        XCTAssertEqual( "berry" + text1, "berryfoo")
    }
    
    func testPrefixSufixDrops() throws {
        XCTAssertEqual("http://foo.com".chars.dropPrefix("http://"), "foo.com")
        XCTAssertEqual("blob".chars.dropPrefix("--"), "blob")
        
        XCTAssertEqual("file.txt".chars.dropSuffix(".txt"), "file")
        XCTAssertEqual("blob".chars.dropSuffix("--"), "blob")
    }
    
    func testFirstLast() throws {
        let greeting = "Hello".chars
        print(greeting.first)
        XCTAssertEqual(greeting.first, "H")
        print(greeting.last)
        XCTAssertEqual(greeting.last, "o")
        let empty = "".chars
        XCTAssertEqual(empty.first, Char.null)
        print(empty.first)
        XCTAssertEqual(empty.last, Char.null)
        print(empty.last)
        XCTAssertEqual(empty.first.isNull, true)
        XCTAssertEqual(greeting.first.isNull, false)
    }
    
    func testEmoji() throws {
        let string = "👩‍👩‍👧‍👦👩‍🚀🤦🏾‍♂️👨‍👩‍👧".chars
        XCTAssertEqual(string.count, 4)
        print("Count: \(string.count)")
        let string2 = "👧👧🏻👧🏼👧🏽👧🏾👧🏿".chars
        XCTAssertEqual(string2.last, "👧🏿")
        print("Count: \(string2.last)")
        XCTAssertEqual(string2[...2], "👧👧🏻👧🏼")
        print("Count: \(string2[...2])")
    }
}
