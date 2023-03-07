//
//  CharsTests.swift
//  
//
//  Created by Daniel Leuck on 2023/03/06.
//

import XCTest
@testable import KiCore

final class CharsTests: XCTestCase {
    
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
}
